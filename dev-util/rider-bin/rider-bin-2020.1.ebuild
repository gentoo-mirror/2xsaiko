# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop

DESCRIPTION=".NET IDE"
HOMEPAGE="https://www.jetbrains.com/rider/"
SRC_URI="https://download.jetbrains.com/rider/JetBrains.Rider-2020.1.0.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-java/jetbrains-jre-bin-11.0.7-r1
	dev-java/jansi-native
	dev-libs/libdbusmenu
	dev-util/lldb"
BDEPEND="dev-util/patchelf"

_IDE='JetBrains Rider'

S="${WORKDIR}/${_IDE}-${PV}"

RESTRICT="strip splitdebug mirror"

src_prepare() {
	rm -r "${S}/jbr"
	rm -vf "${S}"/plugins/maven/lib/maven3/lib/jansi-native/*/libjansi*
	rm -vrf "${S}"/lib/pty4j-native/linux/ppc64le
	rm -vf "${S}"/bin/libdbm64*

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
	local dir="/opt/${P}"

	dodir "${dir}"
	cp -a "${S}"/* "${ED}/${dir}/"

	dosym "${dir}/bin/rider.sh" "/usr/bin/${PN}"
	dosym "${dir}/bin/rider.png" "/usr/share/pixmaps/${PN}.png"
	make_desktop_entry "${PN}" "Rider" "${PN}" "Development;IDE;" "StartupWMClass=jetbrains-rider"

	# recommended by: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/" || die
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-idea-inotify-watches.conf" || die
}
