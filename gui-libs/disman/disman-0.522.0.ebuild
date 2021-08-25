# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="forceoptional"
QTMIN=5.14.0
KFMIN=5.66.0
inherit ecm

MY_TAR_NAME="${PN}-${PN}@${PV}"

DESCRIPTION="Qt/C++ display management library"
HOMEPAGE="https://gitlab.com/kwinft/disman/"
SRC_URI="https://gitlab.com/kwinft/${PN}/-/archive/${PN}@${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=kde-frameworks/extra-cmake-modules-5.66.0
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qttest-${QTMIN}:5
	kwayland? ( >=kde-frameworks/kwayland-${KFMIN} )
	wrapland? ( >=gui-libs/wrapland-${PV} )
	X? (
		x11-libs/libxcb
		x11-libs/libXrandr
	)"
RDEPEND="${DEPEND}"
BDEPEND=""

IUSE="kwayland +wrapland -X"

S="${WORKDIR}/${MY_TAR_NAME}"

src_configure() {
	local mycmakeargs=(
		$(cmake_use_find_package kwayland KF5Wayland)
		$(cmake_use_find_package wrapland Wrapland)
		$(cmake_use_find_package X XCB)
	)

	cmake_src_configure
}
