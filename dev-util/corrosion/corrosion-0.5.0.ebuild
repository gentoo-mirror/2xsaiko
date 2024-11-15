# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	bitflags@1.3.2
	camino@1.1.6
	cargo-platform@0.1.3
	cargo_metadata@0.17.0
	clap@2.34.0
	itoa@1.0.9
	proc-macro2@1.0.66
	quote@1.0.33
	ryu@1.0.15
	semver@1.0.18
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.105
	syn@2.0.29
	textwrap@0.11.0
	thiserror-impl@1.0.47
	thiserror@1.0.47
	unicode-ident@1.0.11
	unicode-width@0.1.10
"

inherit cmake cargo

DESCRIPTION="Use Rust in CMake projects"
HOMEPAGE="https://github.com/AndrewGaspar/corrosion"
SRC_URI="
	https://github.com/corrosion-rs/corrosion/archive/refs/tags/v${PV}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	MIT Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	local old_s="${S}"
	S="${S}/generator"
	cargo_src_unpack
	S="${old_s}"
}

src_prepare() {
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

	cd generator
	cargo_src_install
	# corrosion-generator should go in libexec instead of bin
	mv "${ED}"/usr/bin "${ED}"/usr/libexec
}

src_test() {
	cmake_src_test

	cd generator
	cargo_src_test
}
