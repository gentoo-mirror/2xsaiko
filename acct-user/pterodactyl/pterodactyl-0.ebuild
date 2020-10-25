# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for pterodactyl-daemon"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( pterodactyl )
ACCT_USER_HOME=/var/lib/pterodactyl-daemon

acct-user_add_deps