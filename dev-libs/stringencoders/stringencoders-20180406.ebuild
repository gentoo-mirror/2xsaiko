# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Fast c-string transformations"
HOMEPAGE="https://github.com/client9/stringencoders"

MY_COMMIT_HASH="e1448a9415f4ebf6f559c86718193ba067cbb99d"

SRC_URI="https://github.com/client9/stringencoders/archive/${MY_COMMIT_HASH}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/stringencoders-${MY_COMMIT_HASH}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	emake install DESTDIR="${D}"
	doheader src/modp_stdint.h
}
