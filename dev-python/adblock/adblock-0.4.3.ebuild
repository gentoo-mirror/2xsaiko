# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml

CRATES="
	adblock-0.3.10
	addr-0.11.8
	adler-0.2.3
	aho-corasick-0.7.15
	autocfg-1.0.1
	base64-0.13.0
	bitflags-1.2.1
	byteorder-1.3.4
	cfg-if-1.0.0
	crc32fast-1.2.1
	ctor-0.1.16
	either-1.6.1
	flate2-1.0.19
	form_urlencoded-1.0.0
	ghost-0.1.2
	idna-0.2.0
	indoc-1.0.3
	instant-0.1.9
	inventory-0.1.10
	inventory-impl-0.1.10
	itertools-0.9.0
	lazy_static-1.4.0
	libc-0.2.81
	lock_api-0.4.2
	matches-0.1.8
	memchr-2.3.4
	miniz_oxide-0.4.3
	num-traits-0.2.14
	once_cell-1.5.2
	parking_lot-0.11.1
	parking_lot_core-0.8.1
	paste-1.0.4
	percent-encoding-2.1.0
	proc-macro2-1.0.24
	psl-2.0.7
	psl-types-2.0.2
	pyo3-0.13.1
	pyo3-macros-0.13.1
	pyo3-macros-backend-0.13.1
	quote-1.0.7
	redox_syscall-0.1.57
	regex-1.4.2
	regex-syntax-0.6.21
	rmp-0.8.9
	rmp-serde-0.13.7
	scopeguard-1.1.0
	seahash-3.0.7
	serde-1.0.118
	serde_derive-1.0.118
	smallvec-1.5.1
	syn-1.0.54
	thread_local-1.0.1
	tinyvec-1.1.0
	tinyvec_macros-0.1.0
	twoway-0.2.1
	unchecked-index-0.2.2
	unicode-bidi-0.3.4
	unicode-normalization-0.1.16
	unicode-xid-0.2.1
	unindent-0.1.7
	url-2.2.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo distutils-r1

PSL_COMMIT="3c1add017dd9b8ee81ca490f75262d067af53f7d"

DESCRIPTION="Brave's adblock library in Python"
HOMEPAGE="https://github.com/ArniDagur/python-adblock"
SRC_URI="
	https://github.com/ArniDagur/python-adblock/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://raw.githubusercontent.com/publicsuffix/list/${PSL_COMMIT}/public_suffix_list.dat -> public_suffix_list-${PSL_COMMIT}.dat
	$(cargo_crate_uris ${CRATES})"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/python-adblock-${PV}"

RESTRICT="mirror"

src_prepare() {
	# required by distutils-r1
	sed -i 's,build-backend = "maturin",build-backend = "poetry.masonry.api",' "${S}"/pyproject.toml

	# patch library to not try to download files at build time
	sed -i "s,List::fetch(),List::from_str(include_str!(\"${DISTDIR}/public_suffix_list-${PSL_COMMIT}.dat\"))," \
		"${WORKDIR}"/cargo_home/gentoo/psl-codegen-0.4.2/src/lib.rs

	distutils-r1_src_prepare
}

src_compile() {
	distutils-r1_src_compile
}

src_install() {
	distutils-r1_src_install
}

python_compile() {
	ECARGO_ARGS=(--target-dir "${BUILD_DIR}")
	cargo_src_compile
	distutils-r1_python_compile
}

python_install() {
	insinto "$(python_get_sitedir)/adblock"
	newins "${BUILD_DIR}/release/libadblock.so" adblock.so

	distutils-r1_python_install
}
