# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="botamusique user"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( botamusique )
ACCT_USER_HOME="/var/lib/botamusique"

acct-user_add_deps
