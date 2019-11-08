# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="A plugin for dolphin to show the seafile synchronization status"
HOMEPAGE="https://github.com/Skycoder42/dolphin-seafile-plugin"
SRC_URI="https://github.com/Skycoder42/dolphin-seafile-plugin/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="-amd64 -x86"
IUSE=""

DEPEND="kde-frameworks/kio kde-apps/dolphin net-misc/seafile net-libs/libsearpc"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/dolphin-seafile-plugin-${PV}"

src_prepare() {
	default
	mkdir -p build
}

src_configure() {
	cd build
	eqmake5 ..
}

src_compile() {
	cd build
	emake qmake_all
	emake
}

src_install() {
	cd build/plugin
	emake INSTALL_ROOT="${D}" install
}
