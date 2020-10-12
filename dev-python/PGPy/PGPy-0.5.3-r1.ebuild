# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..8} )
inherit distutils-r1

DESCRIPTION="Pretty Good Privacy for Python"
HOMEPAGE="https://github.com/SecurityInnovation/PGPy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/wheel"
RDEPEND="
	dev-python/cryptography
	dev-python/pyasn1
	dev-python/six"
BDEPEND=""
