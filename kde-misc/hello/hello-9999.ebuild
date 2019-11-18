# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="A window decoration for KDE"
HOMEPAGE="https://github.com/n4n0GH/hello"
EGIT_REPO_URI="https://github.com/n4n0GH/hello"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+colors -style +decoration +theme +effects"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWITH_COLOR_SCHEME=$(usex colors)
		-DWITH_KSTYLE=$(usex style)
		-DWITH_WINDOW_DECORATION=$(usex decoration)
		-DWITH_PLASMA_THEME=$(usex theme)
		-DWITH_KWIN_EFFECTS=$(usex effects)
	)

	cmake-utils_src_configure
}
