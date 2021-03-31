# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit python-single-r1 npm2x git-r3

DESCRIPTION="Bot to play youtube/soundcloud/radio/local music on Mumble."
HOMEPAGE="https://github.com/azlux/botamusique"
EGIT_REPO_URI="https://github.com/azlux/botamusique"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
	acct-user/botamusique
	$(python_gen_impl_dep sqlite)
	$(python_gen_cond_dep '
		dev-python/flask[${PYTHON_USEDEP}]
		net-misc/youtube-dl[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		media-libs/mutagen[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pymumble[${PYTHON_USEDEP}]
		dev-python/pyradios[${PYTHON_USEDEP}]
	')"
BDEPEND=""

PATCHES="${FILESDIR}/absolute-db-paths.patch"

src_unpack() {
	git-r3_src_unpack

	cd "${S}"/web
	npm install
}

src_prepare() {
	default
	python_fix_shebang mumbleBot.py
}

src_compile() {
	cd "${S}"/web
	npm2x_src_compile
	npm run build
	cd "${S}"
	${EPYTHON} scripts/translate_templates.py --lang-dir lang/ --template-dir templates/
}

src_install() {
	dobin "${FILESDIR}/botamusique"

	insinto /etc
	newins configuration.example.ini botamusique.ini

	insinto "/usr/share/${PN}"
	for f in lang static templates configuration.default.ini; do
		doins -r "${f}"
		dosym "${EPREFIX}/usr/share/${PN}/${f}" "/usr/libexec/${PN}/${f}"
	done

	insinto "/usr/libexec/${PN}/media"
	doins -r media/*.py
	insinto "/usr/libexec/${PN}"
	doins -r *.py
	insopts -m755
	doins mumbleBot.py

	newinitd "${FILESDIR}/botamusique.init" botamusique
	newconfd "${FILESDIR}/botamusique.conf" botamusique

	python_optimize "${ED}/usr/libexec/${PN}"
}
