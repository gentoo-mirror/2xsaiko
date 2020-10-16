# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..8} )
inherit distutils-r1

DESCRIPTION="Various utility functions for SQLAlchemy."
HOMEPAGE="https://github.com/kvesteri/sqlalchemy-utils"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/six
	dev-python/sqlalchemy"
BDEPEND=""
