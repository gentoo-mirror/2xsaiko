# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit webapp

DESCRIPTION="An open-source game server management panel"
HOMEPAGE="https://pterodactyl.io/"
SRC_URI="https://github.com/pterodactyl/panel/releases/download/v${PV}/panel.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-db/mariadb-10.2:*
	dev-db/redis
	>=dev-lang/php-7.3:*[cli,ssl,gd,mysql,pdo,tokenizer,bcmath,xml,curl,zip]
	dev-php/composer"
RDEPEND="${DEPEND}"
BDEPEND=""

need_httpd

S="${WORKDIR}/panel-${PV}"

# composer is even worse than npm when it comes to this :(
RESTRICT=network-sandbox

src_unpack() {
	mkdir "${S}"
	cd "${S}"

	default
}

src_prepare() {
	find "${S}" -type f -name .gitignore -delete
	find "${S}" -type f -name .githold -delete

	default
}

src_compile() {
	cp .env.example .env
	composer install --no-interaction --no-dev --prefer-dist --optimize-autoloader || die "composer failed."
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r . # \
	#	app/ bootstrap/ config/ database/ public/ resources/ routes/ storage/ tests/ vendor/ \
	#	artisan  server.php \
	#	composer.json composer.lock package.json yarn.lock \
	#	.env

	webapp_serverowned "${MY_HTDOCSDIR}"/.env
	webapp_serverowned -R "${MY_HTDOCSDIR}"/config
	webapp_serverowned -R "${MY_HTDOCSDIR}"/storage
	webapp_configfile "${MY_HTDOCSDIR}"/.env
	webapp_configfile "${MY_HTDOCSDIR}"/config
	webapp_configfile "${MY_HTDOCSDIR}"/storage

	webapp_src_install
}
