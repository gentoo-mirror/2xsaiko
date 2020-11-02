# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )
inherit distutils-r1 npm2x

MY_PN="core.sr.ht"
MY_P="${MY_PN}-${PV}"

BOOTSTRAP_V="4.5.2"

DESCRIPTION="sr.ht shared code"
HOMEPAGE="https://git.sr.ht/~sircmpwn/core.sr.ht"

NPM_MODULES="
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz	balanced-match
	https://registry.npmjs.org/commander/-/commander-2.15.1.tgz	commander
	https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz	concat-map
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz	brace-expansion
	https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz	fs.realpath
	https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz	inherits
	https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz	minimatch
	https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz	path-is-absolute
	https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz	source-map
	https://registry.npmjs.org/clean-css/-/clean-css-4.1.11.tgz	clean-css
	https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz	wrappy
	https://registry.npmjs.org/once/-/once-1.4.0.tgz	once
	https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz	inflight
	https://registry.npmjs.org/glob/-/glob-7.1.2.tgz	glob
	https://registry.npmjs.org/clean-css-cli/-/clean-css-cli-4.1.11.tgz	clean-css-cli
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
