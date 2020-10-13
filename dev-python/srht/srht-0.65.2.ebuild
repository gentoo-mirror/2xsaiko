# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )
inherit distutils-r1

MY_PN="core.sr.ht"
MY_P="${MY_PN}-${PV}"

BOOTSTRAP_V="4.5.2"

DESCRIPTION="sr.ht shared code"
HOMEPAGE="https://git.sr.ht/~sircmpwn/core.sr.ht"

# For bootstrap
#     find node_modules -name package.json -exec jq -r '._resolved' {} \; | grep -v '^null$'

SRHT_NODE_DEPS="
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.npmjs.org/clean-css/-/clean-css-4.1.11.tgz
	https://registry.npmjs.org/clean-css-cli/-/clean-css-cli-4.1.11.tgz
	https://registry.npmjs.org/commander/-/commander-2.15.1.tgz
	https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz
	https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.npmjs.org/glob/-/glob-7.1.2.tgz
	https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz
	https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz
	https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz
	https://registry.npmjs.org/once/-/once-1.4.0.tgz
	https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz
	https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz
"

SRC_URI="
	https://git.sr.ht/~sircmpwn/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz
	https://github.com/twbs/bootstrap/archive/v${BOOTSTRAP_V}.tar.gz -> bootstrap-v${BOOTSTRAP_V}.tar.gz
	${SRHT_NODE_DEPS}
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/nodejs[npm]"
RDEPEND=""
BDEPEND=""

S="${WORKDIR}/${MY_P}"

export PKGVER="${PV}"

PATCHES=(
	"${FILESDIR}/0001-Dont-use-npm-install.patch"
)

src_unpack() {
	# Do not extract all the bootstrap dependencies
	unpack "${MY_P}.tar.gz"
	unpack "bootstrap-v${BOOTSTRAP_V}.tar.gz"

	_install_node_deps "${S}/srht" "${SRHT_NODE_DEPS}"
}

python_prepare_all() {
	mv "${WORKDIR}/bootstrap-${BOOTSTRAP_V}"/* "${S}/srht/scss/bootstrap/"

	distutils-r1_python_prepare_all
}

_install_node_deps() {
	total="$(echo $2 | awk '{print NF}')"
	i=1
	for entry in $2; do
		filename="$(basename "$entry")"
		pkgdir="$(sed -E 's,^https://registry.npmjs.org/(.*)/-/.*$,\1,' <<< "$entry")"
		einfo "[$i/$total] $filename"
		mkdir -p "$1/node_modules/$pkgdir"
		tar xf "${DISTDIR}/$filename" --strip-components=1 -C "$1/node_modules/$pkgdir"
		let i+=1
	done
}
