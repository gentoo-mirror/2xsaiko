# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_7 )
inherit distutils-r1

DESCRIPTION="MinIO Python Library for Amazon S3 Compatible Cloud Storage for Python"
HOMEPAGE="https://github.com/minio/minio-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/certifi"
BDEPEND=""
