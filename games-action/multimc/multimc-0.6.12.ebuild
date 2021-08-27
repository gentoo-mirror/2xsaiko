# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop

LIBNBTPLUSPLUS_COMMIT="dc72a20b7efd304d12af2025223fad07b4b78464"
QUAZIP_COMMIT="3691d57d3af13f49b2be2b62accddefee3c26b9c"

DESCRIPTION="Free, open source launcher and instance manager for Minecraft."
HOMEPAGE="https://multimc.org"
SRC_URI="
	https://github.com/MultiMC/MultiMC5/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/MultiMC/libnbtplusplus/archive/${LIBNBTPLUSPLUS_COMMIT}.tar.gz -> libnbtplusplus-${LIBNBTPLUSPLUS_COMMIT}.tar.gz
	https://github.com/MultiMC/quazip/archive/${QUAZIP_COMMIT}.tar.gz -> quazip-${LIBNBTPLUSPLUS_COMMIT}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-apps/xrandr
	sys-libs/zlib
	virtual/jre:*"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES="
	${FILESDIR}/3747.patch
	${FILESDIR}/3a1abb555b844c79a80615727b11019403767ce7.patch"

S="${WORKDIR}/MultiMC5-${PV}"

src_unpack() {
	default_src_unpack

	rmdir "${S}/libraries/libnbtplusplus" || die "Couldn't remove libnbtplusplus directory"
	rmdir "${S}/libraries/quazip" || die "Couldn't remove quazip directory"
	ln -s "${WORKDIR}/libnbtplusplus-${LIBNBTPLUSPLUS_COMMIT}" "${S}/libraries/libnbtplusplus"
	ln -s "${WORKDIR}/quazip-${QUAZIP_COMMIT}" "${S}/libraries/quazip"
}

src_configure() {
	local mycmakeargs=(
		-DMultiMC_UPDATER=OFF
		-DMultiMC_LAYOUT=lin-system
		-DMultiMC_BUILD_PLATFORM=Gentoo
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
