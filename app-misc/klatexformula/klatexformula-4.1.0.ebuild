# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

REL_VERSION="KLF_${PV//./-}"

DESCRIPTION="Generates images from LaTeX equations."
HOMEPAGE="https://klatexformula.sourceforge.io/"
SRC_URI="https://github.com/klatexformula/klatexformula/archive/${REL_VERSION}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${REL_VERSION}"

src_prepare() {
	sed -i "41i#include <QPainterPath>" "${S}"/src/klftools/klfflowlistwidget_p.h

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		"-DKLF_INSTALL_POST_UPDATEMIMEDATABASE=NO"
	)

	cmake_src_configure
}
