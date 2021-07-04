# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake cargo

DESCRIPTION="Use Rust in CMake projects"
HOMEPAGE="https://github.com/AndrewGaspar/corrosion"
#SRC_URI="$(cargo_crate_uris ${CRATES})"
EGIT_REPO_URI="https://github.com/AndrewGaspar/corrosion"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

#RESTRICT=network-sandbox

src_unpack() {
	git-r3_src_unpack

	local old_s="${S}"
	S="${S}/generator"
	cargo_live_src_unpack
	S="${old_s}"
}

src_prepare() {
	# Fix the install paths
	sed -Ei \
		-e 's,Corrosion/libexec,libexec,g' \
		-e 's,Corrosion/lib/cmake,lib/cmake,g' \
		-e 's,Corrosion/share/cmake,share/cmake,g' \
		"${S}"/CMakeLists.txt \
		"${S}"/cmake/CorrosionConfig.cmake.in

	# Don't compile the generator through CMake because we need to let the cargo
	# eclass handle compliation since at this point there's no network access
	sed -Ei \
		-e 's,include\(Corrosion\),# \0,' \
		-e 's,add_subdirectory\(test\),# \0,' \
		-e 's,corrosion_(import_crate|set_linker_language|install)\(,set(_UNUSED ,' \
		"${S}"/CMakeLists.txt

	cmake_src_prepare
}

src_configure() {
	cmake_src_configure

	cd generator
	cargo_src_configure
}

src_compile() {
	cmake_src_compile

	cd generator
	cargo_src_compile
}

src_install() {
	cmake_src_install

	insinto /usr/libexec
	insopts -m755
	doins generator/target/release/corrosion-generator
}

src_test() {
	cmake_src_test

	cd generator
	cargo_src_test
}
