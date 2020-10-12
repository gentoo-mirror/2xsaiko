# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )
inherit distutils-r1

DESCRIPTION="A fast PostgreSQL Database Client Library for Python/asyncio."
HOMEPAGE="https://github.com/MagicStack/asyncpg"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	<dev-db/postgresql-13.0:*"
DEPEND="${RDEPEND}
	dev-python/cython"
BDEPEND=""
