# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Mumble client implementation in Python"
HOMEPAGE="https://pypi.org/project/pymumble/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/opuslib-3.0.1
	>=dev-python/protobuf-python-3.12.2"
BDEPEND=""

src_install() {
	distutils-r1_src_install

	# no
	rm "${ED}"/usr/{API.md,LICENSE,requirements.txt}
}
