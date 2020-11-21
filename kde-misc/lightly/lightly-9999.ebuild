# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="A window decoration for KDE"
HOMEPAGE="https://github.com/Luwx/Lightly"
EGIT_REPO_URI="https://github.com/Luwx/Lightly"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	kde-frameworks/extra-cmake-modules
	kde-plasma/kdecoration
	dev-qt/qtdeclarative
	dev-qt/qtx11extras"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
	)

	cmake-utils_src_configure
}
