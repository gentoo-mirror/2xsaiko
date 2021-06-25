# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{6..9} )
inherit distutils-r1

MY_PN="paste.sr.ht"

DESCRIPTION="sr.ht pastebin services"
HOMEPAGE="https://git.sr.ht/~sircmpwn/paste.sr.ht"
SRC_URI="https://git.sr.ht/~sircmpwn/${MY_PN}/archive/${PV}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	acct-user/srht-paste
	net-libs/nodejs
	dev-lang/sassc"
RDEPEND="${DEPEND}
	dev-python/srht
	dev-python/pyyaml
	www-servers/gunicorn
	postgres? ( dev-python/psycopg )"
BDEPEND=""

IUSE="+postgres"

S="${WORKDIR}/${MY_PN}-${PV}"

export PKGVER="${PV}"

src_install() {
	distutils-r1_src_install

	newinitd "${FILESDIR}/srht-paste-r1" srht-paste
	doinitd "${FILESDIR}/srht-paste-webhooks"
	newconfd "${FILESDIR}/srht-paste.conf" srht-paste
}

pkg_postinst() {
	elog 'Upgrading database...'
	srht-migrate paste.sr.ht -a upgrade head
	pastesrht-migrate -a upgrade head
}
