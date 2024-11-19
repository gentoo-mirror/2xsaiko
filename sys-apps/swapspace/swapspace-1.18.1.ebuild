# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="A fork of Jeroen T. Vermeulen's excellent dynamic swap space manager"
HOMEPAGE="https://github.com/Tookmund/Swapspace"
SRC_URI="https://github.com/Tookmund/Swapspace/releases/download/v${PV}/swapspace-${PV}.tar.gz"

# Source directory; the dir where the sources can be found (automatically
# unpacked) inside ${WORKDIR}.  The default value for S is ${WORKDIR}/${P}
# If you don't need to change it, leave the S= line out of the ebuild
# to keep it tidy.
#S="${WORKDIR}/${P}"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

src_configure() {
	econf --localstatedir=/var --sysconfdir=/etc/swapspace
}

src_install() {
	default

	systemd_dounit "${FILESDIR}"/swapspace.service
}
