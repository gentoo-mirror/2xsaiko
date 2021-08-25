# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ECM_TEST="forceoptional"
QTMIN=5.12.0
KFMIN=5.66.0
inherit ecm

MY_TAR_NAME="${PN}-${PN}@${PV}"

DESCRIPTION="App and daemon for display managing"
HOMEPAGE="https://gitlab.com/kwinft/kdisplay/"
SRC_URI="https://gitlab.com/kwinft/${PN}/-/archive/${PN}@${PV}/${MY_TAR_NAME}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( LGPL-2.1 GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=kde-frameworks/extra-cmake-modules-5.66.0
	>=dev-qt/qttest-${QTMIN}:5
	>=dev-qt/qtsensors-${QTMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}
	>=kde-frameworks/kdeclarative-${KFMIN}
	>=kde-frameworks/ki18n-${KFMIN}
	gui-libs/disman"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_TAR_NAME}"
