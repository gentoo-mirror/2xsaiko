# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake desktop

DESCRIPTION="Free, open source launcher and instance manager for Minecraft."
HOMEPAGE="https://multimc.org"
EGIT_REPO_URI="https://github.com/MultiMC/MultiMC5"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-apps/xrandr
	sys-libs/zlib
	virtual/jre:*"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DMultiMC_UPDATER=OFF
		-DMultiMC_LAYOUT=lin-system
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	doicon "application/resources/multimc/scalable/multimc.svg"
	domenu "application/package/linux/multimc.desktop"
	dolib.so "${BUILD_DIR}/libMultiMC_quazip.so"
	dolib.so "${BUILD_DIR}/libMultiMC_nbt++.so"
}
