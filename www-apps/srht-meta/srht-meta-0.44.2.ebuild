# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )
inherit distutils-r1

MY_PN="meta.sr.ht"

DESCRIPTION="sr.ht core account services"
HOMEPAGE="https://git.sr.ht/~sircmpwn/meta.sr.ht"
SRC_URI="https://git.sr.ht/~sircmpwn/${MY_PN}/archive/${PV}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	acct-user/srht-meta
	net-libs/nodejs
	dev-lang/sassc"
RDEPEND="${DEPEND}
	dev-python/bcrypt
	dev-python/prometheus_client
	dev-python/PGPy
	dev-python/pystache
	dev-python/qrcode
	dev-python/redis-py
	dev-python/srht
	dev-python/python-sshpubkeys
	dev-python/zxcvbn
	dev-db/redis
	www-servers/gunicorn
	postgres? ( dev-python/psycopg )
	billing? ( dev-python/stripe dev-python/weasyprint )"
BDEPEND=""

IUSE="+postgres billing"

S="${WORKDIR}/${MY_PN}-${PV}"

export PKGVER="${PV}"

src_install() {
	distutils-r1_src_install

	doinitd "${FILESDIR}/srht-meta"
	doinitd "${FILESDIR}/srht-meta-webhooks"
	newconfd "${FILESDIR}/srht-meta.conf" srht-meta
}

pkg_preinst() {
	if has_version "${CATEGORY}/${PN}"; then
		OLD_SRHT_VERSION=1
	fi
}

pkg_postinst() {
	if [[ -n "$OLD_SRHT_VERSION" ]]; then
		elog 'Upgrading database...'
		srht-migrate meta.sr.ht -a upgrade head
		metasrht-migrate -a upgrade head
	fi
}
