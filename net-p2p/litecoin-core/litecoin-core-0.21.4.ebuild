# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} python3_13t )

inherit autotools check-reqs db-use desktop edo multiprocessing python-any-r1 xdg-utils

DESCRIPTION="Reference implementation of the Litecoin cryptocurrency"
HOMEPAGE="https://litecoin.org/"
SRC_URI="
	https://github.com/litecoin-project/litecoin/archive/v${PV/_rc/rc}.tar.gz -> ${P}.tar.gz
"
S="${WORKDIR}/${PN/-core}-${PV/_rc/rc}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+asm +berkdb +cli +daemon dbus examples +external-signer +gui kde +man nat-pmp +qrcode +sqlite systemtap test test-full upnp zeromq"
RESTRICT="!test? ( test )"

REQUIRED_USE="
	dbus? ( gui )
	kde? ( gui )
	qrcode? ( gui )
	test-full? ( test )
"
# dev-libs/univalue is now bundled, as upstream dropped support for system copy
# and their version in the Bitcoin repo has deviated a fair bit from upstream.
# Upstream also seems very inactive.
RDEPEND="
	>=dev-libs/boost-1.81.0:=
	>=dev-libs/libevent-2.1.12:=
	berkdb? ( >=sys-libs/db-4.8.30:$(db_ver_to_slot 4.8)=[cxx] )
	daemon? (
		acct-group/bitcoin
		acct-user/bitcoin
	)
	gui? (
		>=dev-qt/qtcore-5.15.14:5
		>=dev-qt/qtgui-5.15.14:5
		>=dev-qt/qtnetwork-5.15.14:5
		>=dev-qt/qtwidgets-5.15.14:5
		dbus? ( >=dev-qt/qtdbus-5.15.14:5 )
	)
	nat-pmp? ( >=net-libs/libnatpmp-20230423:= )
	qrcode? ( >=media-gfx/qrencode-4.1.1:= )
	sqlite? ( >=dev-db/sqlite-3.38.5:= )
	upnp? ( >=net-libs/miniupnpc-2.2.7:= )
	zeromq? ( >=net-libs/zeromq-4.3.4:= )
"
DEPEND="
	${RDEPEND}
	systemtap? ( >=dev-debug/systemtap-4.8 )
"
BDEPEND="
	virtual/pkgconfig
	daemon? (
		acct-group/bitcoin
		acct-user/bitcoin
	)
	gui? ( >=dev-qt/linguist-tools-5.15.14:5 )
	test? ( ${PYTHON_DEPS} )
"
IDEPEND="
	gui? ( dev-util/desktop-file-utils )
"

DOCS=(
	doc/bips.md
	doc/bitcoin-conf.md
	doc/descriptors.md
	doc/files.md
	doc/JSON-RPC-interface.md
	doc/psbt.md
	doc/reduce-memory.md
	doc/reduce-traffic.md
	doc/release-notes.md
	doc/REST-interface.md
	doc/tor.md
)

PATCHES=(
	#"${FILESDIR}/28.0-syslibs.patch"
	#"${FILESDIR}/26.0-init.patch"
	"${FILESDIR}/boost.patch"
)

efmt() {
	: ${1:?} ; local l ; while read -r l ; do "${!#}" "${l}" ; done < <(fmt "${@:1:$#-1}")
}

pkg_pretend() {
	if ! use daemon && ! use gui && ! has_version "${CATEGORY}/${PN}[-daemon,-gui(-),-qt5(-)]" ; then
		efmt ewarn <<-EOF
			You are enabling neither USE="daemon" nor USE="gui". This is a valid
			configuration, but you will be unable to run a Bitcoin node using this
			installation.
		EOF
	fi
	if use daemon && ! use cli && ! has_version "${CATEGORY}/${PN}[daemon,-bitcoin-cli(-),-cli(-)]" ; then
		efmt ewarn <<-EOF
			You are enabling USE="daemon" but not USE="cli". This is a valid
			configuration, but you will be unable to interact with your bitcoind node
			via the command line using this installation.
		EOF
	fi
	if ! use berkdb && ! use sqlite &&
		{ { use daemon && ! has_version "${CATEGORY}/${PN}[daemon,-berkdb,-sqlite]" ; } ||
		  { use gui && ! has_version "${CATEGORY}/${PN}[gui,-berkdb,-sqlite]" ; } ; }
	then
		efmt ewarn <<-EOF
			You are enabling neither USE="berkdb" nor USE="sqlite". This is a valid
			configuration, but your Bitcoin node will be unable to open any wallets.
		EOF
	fi

	# test/functional/feature_pruning.py requires 4 GB disk space
	# test/functional/wallet_pruning.py requires 1.3 GB disk space
	use test && CHECKREQS_DISK_BUILD="6G" check-reqs_pkg_pretend
}

pkg_setup() {
	if use test ; then
		CHECKREQS_DISK_BUILD="6G" check-reqs_pkg_setup
		python-any-r1_pkg_setup
	fi
}

src_prepare() {
	default

	pushd src/secp256k1-zkp >/dev/null || die
	AT_NOELIBTOOLIZE=yes eautoreconf
	popd >/dev/null || die

	eautoreconf

	# we say --disable-util-util, so we can't test bitcoin-util
	sed -ne '/^  {/{h;:0;n;H;/^  }/!b0;g;\|"exec": *"\./bitcoin-util"|d};p' \
		-i test/util/data/bitcoin-util-test.json || die
}

src_configure() {
	export BDB_CFLAGS="-I/usr/include/db4.8 -DHAVE_CXX_STDHEADERS"

	local wallet ; if use berkdb || use sqlite ; then wallet=enable ; else wallet=disable ; fi
	local myeconfargs=(
		--disable-static
		--${wallet}-wallet
		$(use_with sqlite)
		$(use_with berkdb bdb)
		$(use_enable systemtap usdt)
		$(use_with upnp miniupnpc)
		$(use_with nat-pmp natpmp)
		$(use_enable test tests)
		--disable-bench
		--disable-fuzz{,-binary}
		$(use_with qrcode qrencode)
		--disable-ccache
		$(use_enable asm)
		$(use_enable zeromq zmq)
		$(use_enable man)
		$(use_enable external-signer)
		--with-utils
		$(use_enable {,util-}cli)
		--enable-util-tx
		--${wallet}-util-wallet
		--disable-util-util
		$(use_with daemon)
		$(use_with gui gui qt5)
		$(use_with dbus qtdbus)
		--without-libs
	)
	econf "${myeconfargs[@]}"
}

src_compile() {
	default

	sed -e 's/ To use, copy this file$//p;Tp;:0;n;/save the file\.$/!b0;d;:p;p' \
		-ni share/examples/litecoin.conf || die
}

src_test() {
	emake check

	use daemon && edo "${PYTHON}" test/functional/test_runner.py \
			--ansi $(usev test-full --extended) --jobs="$(get_makeopts_jobs)" --timeout-factor="${TIMEOUT_FACTOR:-15}"
}

src_install() {
	dodoc -r doc/release-notes

	use zeromq && DOCS+=( doc/zmq.md )

	if use daemon ; then
		# https://bugs.gentoo.org/757102
		DOCS+=( share/rpcauth/rpcauth.py )
		docompress -x "/usr/share/doc/${PF}/rpcauth.py"
	fi

	default

	find "${ED}" -type f -name '*.la' -delete || die
	! use test || rm -f -- "${ED}"/usr/bin/test_bitcoin{,-qt} || die

	if use daemon ; then
		insinto /etc/litecoin
		doins share/examples/litecoin.conf
		fowners bitcoin:bitcoin /etc/litecoin/litecoin.conf
		fperms 0660 /etc/litecoin/litecoin.conf

		keepdir /var/lib/litecoind
		fperms 0750 /var/lib/litecoind
		fowners bitcoin:bitcoin /var/lib/litecoind
		dosym -r {/etc/litecoin,/var/lib/litecoind}/litecoin.conf

		insinto /etc/logrotate.d
		newins "${FILESDIR}/litecoind.logrotate-r1" litecoind
	fi

	if use gui ; then
		insinto /usr/share/icons/hicolor/scalable/apps
		newins src/qt/res/src/bitcoin.svg litecoin128.svg

		domenu "${FILESDIR}/org.litecoin.litecoin-qt.desktop"

		if use kde ; then
			insinto /usr/share/kservices5
			doins "${FILESDIR}/litecoin-qt.protocol"
		fi
	fi

	if use examples ; then
		docinto examples
		dodoc -r contrib/{linearize,qos}
		use zeromq && dodoc -r contrib/zmq
	fi
}

pkg_postinst() {
	# we don't use xdg.eclass because it adds unconditional IDEPENDs
	if use gui ; then
		xdg_desktop_database_update
		xdg_icon_cache_update
	fi

	if use daemon && [[ -z "${REPLACING_VERSIONS}" ]] ; then
		efmt -su elog <<-EOF
			To have ${PN} automatically use Tor when it's running, be sure your \
			'torrc' config file has 'ControlPort' and 'CookieAuthentication' set up \
			correctly, and:
			- Using an init script: add the 'bitcoin' user to the 'tor' user group.
			- Running litecoind directly: add that user to the 'tor' user group.
			EOF
	fi

	if use cli && use daemon ; then
		efmt -su elog <<-EOF
			To use litecoin-cli with the /etc/init.d/litecoind service:
			 - Add your user(s) to the 'bitcoin' group.
			 - Symlink ~/.litecoin to /var/lib/litecoind.
		EOF
	fi
}

pkg_postrm() {
	if use gui ; then
		xdg_desktop_database_update
		xdg_icon_cache_update
	fi
}
