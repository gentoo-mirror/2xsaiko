# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=(python3_{10..13} python3_13t)

inherit python-single-r1
inherit git-r3

DESCRIPTION="Interface Builder utility"
HOMEPAGE="https://github.com/viraptor/ibtool"
EGIT_REPO_URI="https://github.com/viraptor/ibtool"

LICENSE="MIT"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}"

BDEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/main.patch"
	"${FILESDIR}/nsmenuitem.patch"
)

src_install() {
	python_domodule ibtool
	python_doscript "${FILESDIR}/ibtool"
}
