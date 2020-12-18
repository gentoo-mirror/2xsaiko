# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop

DESCRIPTION="Intelligent Java IDE"
HOMEPAGE="https://www.jetbrains.com/idea/"
SRC_URI="https://download.jetbrains.com/idea/ideaIU-${PV}-no-jbr.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-java/jetbrains-jre-bin
	dev-java/jansi-native
	dev-libs/libdbusmenu"
BDEPEND="dev-util/patchelf"

_BUILDVER=203.5981.155
_IDE=idea-IU

S="${WORKDIR}/${_IDE}-${_BUILDVER}"

RESTRICT="mirror splitdebug"

src_prepare() {
	rm -vf "${S}"/plugins/maven/lib/maven3/lib/jansi-native/*/libjansi*
	rm -vrf "${S}"/lib/pty4j-native/linux/ppc64le
	rm -vf "${S}"/bin/libdbm64*

	patchelf --replace-needed liblldb.so liblldb.so.9 "${S}"/plugins/Kotlin/bin/linux/LLDBFrontend || die "Unable to patch LLDBFrontend for lldb"

	sed -i \
		-e "\$a\\\\" \
		-e "\$a#-----------------------------------------------------------------------" \
		-e "\$a# Disable automatic updates as these are handled through Gentoo's" \
		-e "\$a# package manager. See bug #704494" \
		-e "\$a#-----------------------------------------------------------------------" \
		-e "\$aide.no.platform.update=Gentoo"  bin/idea.properties

	eapply_user
}

src_install() {
	local dir="/opt/${PN}-${_BUILDVER}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}"/bin/{format.sh,idea.sh,inspect.sh,printenv.py,restart.py,fsnotifier{,64}}

	dosym "${dir}/bin/idea.sh" "/usr/bin/${PN}"
	dosym "${dir}/bin/idea.png" "/usr/share/pixmaps/${PN}.png"
	make_desktop_entry "${PN}" "IntelliJ IDEA" "${PN}" "Development;IDE;" "StartupWMClass=jetbrains-idea"

	# recommended by: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/" || die
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-idea-inotify-watches.conf" || die
}
