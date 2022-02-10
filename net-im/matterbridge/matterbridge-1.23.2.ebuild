# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Bridge between a vast array of instant messaging services"
HOMEPAGE="https://github.com/42wim/matterbridge"
SRC_URI="
	https://github.com/42wim/matterbridge/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="acct-user/matterbridge"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="mirror"

src_compile() {
	go build -v || die
}

src_install() {
	dobin matterbridge
	dodoc matterbridge.toml.sample
	dodoc matterbridge.toml.simple
	newinitd "${FILESDIR}"/matterbridge "${PN}"
	newconfd "${FILESDIR}"/matterbridge.conf "${PN}"
}
