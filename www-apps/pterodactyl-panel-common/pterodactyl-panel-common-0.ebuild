# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Common files for pterodactyl-panel"
HOMEPAGE="https://pterodactyl.io/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	virtual/cron"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	doinitd "${FILESDIR}"/pteroq
	newconfd "${FILESDIR}"/pteroq.conf pteroq

	insinto /etc/cron.d
	newins "${FILESDIR}"/cronjobs pterodactyl-panel

	insinto /usr/libexec/pterodactyl-panel
	insopts -m755
	doins "${FILESDIR}"/run-schedule
}
