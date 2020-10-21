# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The Free Software Media System - prebuilt binaries"
HOMEPAGE="https://jellyfin.org/"
SRC_URI="
	https://repo.jellyfin.org/releases/server/linux/versions/stable/server/${PV}/jellyfin-server_${PV}_linux-amd64.tar.gz
	web? ( https://repo.jellyfin.org/releases/server/linux/versions/stable/web/${PV}/jellyfin-web_${PV}_portable.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="acct-user/jellyfin"
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="+web"

S="${WORKDIR}/jellyfin-server_${PV}"

RESTRICT="strip"

src_prepare() {
	default
	local sedscr

	if use web; then
		sedscr='s/^#web://g'
	else
		sedscr='/^#web:/d'
	fi

	sed -E "${sedscr}" "${FILESDIR}/${PN}.conf.in" > "${WORKDIR}/${PN}.conf"
}

src_install() {
	dodir "/opt"
	cp -a "${S}" "${ED}/opt/${PN}"

	if use web; then
		dodir "/usr/share/${PN}"
		cp -a "${WORKDIR}/jellyfin-web_${PV}" "${ED}/usr/share/${PN}/web"
	fi

	dosym "../../opt/${PN}/jellyfin" "/usr/bin/${PN}"
	doinitd "${FILESDIR}/${PN}"
	newconfd "${WORKDIR}/${PN}.conf" "${PN}"
}
