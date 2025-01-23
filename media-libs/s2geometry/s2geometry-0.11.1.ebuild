# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Computational geometry and spatial indexing on the sphere"
HOMEPAGE="https://github.com/google/s2geometry"

SRC_URI="https://github.com/google/s2geometry/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-cpp/abseil-cpp
	dev-libs/openssl
"

DEPEND="${RDEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DBUILD_TESTS=NO"
	)

	cmake_src_configure
}
