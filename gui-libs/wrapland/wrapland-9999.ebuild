# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="optional"
QTMIN=5.12.0
inherit ecm

MY_TAR_NAME="${PN}-${PN}@${PV}"

DESCRIPTION="Wayland compositor and X11 window manager"
HOMEPAGE="https://gitlab.com/kwinft/wrapland/"

if [[ "${PV}" = "9999" ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://gitlab.com/kwinft/wrapland/"
	KEYWORDS=""
else
	SRC_URI="https://gitlab.com/kwinft/${PN}/-/archive/${PN}@${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"

	S="${WORKDIR}/${MY_TAR_NAME}"
fi

LICENSE="LGPL-2.1"
SLOT="0"

DEPEND="
	>=kde-frameworks/extra-cmake-modules-5.66.0
	>=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-libs/wayland-1.18
	dev-util/wayland-scanner
	>=dev-libs/wayland-protocols-1.21"
RDEPEND="${DEPEND}"
BDEPEND=""
