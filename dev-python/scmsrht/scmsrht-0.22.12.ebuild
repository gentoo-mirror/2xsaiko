# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..10} )
inherit distutils-r1

MY_PN="scm.sr.ht"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="sr.ht source control service shared code"
HOMEPAGE="https://git.sr.ht/~sircmpwn/scm.sr.ht"

SRC_URI="https://git.sr.ht/~sircmpwn/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/srht"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"

export PKGVER="${PV}"
