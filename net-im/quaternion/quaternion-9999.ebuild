# Copyright 2019-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3 xdg-utils

DESCRIPTION="A Qt-based IM client for Matrix"
HOMEPAGE="https://github.com/quotient-im/Quaternion https://matrix.org/ecosystem/clients/quaternion/"
EGIT_REPO_URI="https://github.com/quotient-im/Quaternion"
EGIT_SUBMODULES=()

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND="
	dev-qt/qtbase:6[widgets,network,gui]
	dev-qt/qttools:6[linguist]
	dev-qt/qtdeclarative:6[widgets]
	net-libs/libquotient
	dev-libs/qtkeychain:=
"
DEPEND="
	${RDEPEND}
	dev-qt/qtmultimedia:6
"
BDEPEND="
	dev-qt/qttools:6[linguist]
"

DOCS=( {README,SECURITY}.md )

PATCHES=(
	"${FILESDIR}/0001-Include-type_traits-to-fix-error-when-compiling-with.patch"
)

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
