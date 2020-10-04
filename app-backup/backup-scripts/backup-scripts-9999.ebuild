# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Backup scripts based on borgbackup"
HOMEPAGE="https://git.sr.ht/~dblsaiko/backup-scripts"
EGIT_REPO_URI="https://git.sr.ht/~dblsaiko/backup-scripts"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="cron"

DEPEND=""
RDEPEND="${DEPEND} app-backup/borgbackup cron? ( virtual/cron )"
BDEPEND=""

CONFIG_PROTECT="/etc/backup"

src_install() {
	dosbin system-backup

	insinto /etc/backup
	doins excludes
	dodir /etc/backup/before.d
	dodir /etc/backup/after.d
	insopts -m0600
	doins config

	if use cron; then
		dosym ../../usr/sbin/system-backup /etc/cron.daily/system-backup
	fi
}
