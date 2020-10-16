# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User account for git.sr.ht"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( srht-git sourcehut )
ACCT_USER_HOME=/var/lib/srht-git
ACCT_USER_SHELL=/bin/sh

acct-user_add_deps
