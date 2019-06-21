# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="Convert Xcur format to PNG"
HOMEPAGE="https://github.com/eworm-de/xcur2png"
EGIT_REPO_URI="https://github.com/eworm-de/xcur2png"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="x11-libs/libXcursor media-libs/libpng:*"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	# doesn't work for some reason (tries to install into /), so let's do it manually
	# emake INSTALL_ROOT="${D}" install

	dobin xcur2png
	doman xcur2png.1
}
