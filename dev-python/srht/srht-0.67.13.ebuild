# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{8..10} )
inherit distutils-r1 npm2x

MY_PN="core.sr.ht"
MY_P="${MY_PN}-${PV}"

BOOTSTRAP_V="4.5.2"

DESCRIPTION="sr.ht shared code"
HOMEPAGE="https://git.sr.ht/~sircmpwn/core.sr.ht"

NPM_MODULES="
	clean-css 4.1.11	clean-css
	concat-map 0.0.1	concat-map
	clean-css-cli 4.1.11	clean-css-cli
	wrappy 1.0.2	wrappy
	inflight 1.0.6	inflight
	once 1.4.0	once
	commander 2.15.1	commander
	fs.realpath 1.0.0	fs.realpath
	balanced-match 1.0.0	balanced-match
	brace-expansion 1.1.11	brace-expansion
	glob 7.1.2	glob
	inherits 2.0.3	inherits
	source-map 0.5.7	source-map
	path-is-absolute 1.0.1	path-is-absolute
	minimatch 3.0.4	minimatch
"
npm2x_set_globals

SRC_URI="
	https://git.sr.ht/~sircmpwn/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_V}.tar.gz -> bootstrap-v${BOOTSTRAP_V}.tar.gz
	${NPM_SRC_URI}
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/nodejs[npm]
	dev-python/alembic
	dev-python/beautifulsoup:4
	dev-python/bleach
	dev-python/celery
	dev-python/cryptography
	dev-python/flask
	dev-python/html5lib
	dev-python/humanize
	dev-python/mistletoe
	dev-python/pygments
	dev-python/requests
	dev-python/sqlalchemy
	dev-python/SQLAlchemy-Utils"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_P}"

export PKGVER="${PV}"

PATCHES=(
	"${FILESDIR}/0001-Dont-use-npm-install.patch"
)

src_unpack() {
	unpack "${MY_P}.tar.gz"
	unpack "bootstrap-v${BOOTSTRAP_V}.tar.gz"

	cd "${S}/srht"
	npm2x_src_unpack_modules
}

python_prepare_all() {
	mv "${WORKDIR}/bootstrap-${BOOTSTRAP_V}"/* "${S}/srht/scss/bootstrap/"

	distutils-r1_python_prepare_all
}

src_compile() {
	cd "${S}/srht"
	npm2x_src_compile

	cd "${S}"
	distutils-r1_src_compile
}
