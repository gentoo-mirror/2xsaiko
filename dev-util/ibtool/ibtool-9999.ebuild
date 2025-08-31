# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..13} python3_13t)

inherit distutils-r1
inherit git-r3

DESCRIPTION="Interface Builder utility"
HOMEPAGE="https://github.com/viraptor/ibtool"
EGIT_REPO_URI="https://github.com/viraptor/ibtool"

PATCHES=(
	"${FILESDIR}/build-system.patch"
)

LICENSE="MIT"
SLOT="0"
