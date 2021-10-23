# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION=".NET IDE"
HOMEPAGE="https://www.jetbrains.com/rider/"
SRC_URI="https://download.jetbrains.com/rider/JetBrains.Rider-2020.1.0.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

IDE_FULL_NAME="Rider"
IDE_BIN_NAME="rider"
IDE_DIST_NAME="JetBrains Rider"

src_prepare() {
	# keep this one if we're on a musl system?
	rm -r "${S}"/lib/ReSharperHost/linux-musl-x64
	rm -r "${S}"/lib/ReSharperHost/linux-{arm,arm64,arm64.dbg,musl-arm64,x86}
	rm -r "${S}"/lib/ReSharperHost/windows*
	rm -r "${S}"/lib/ReSharperHost/macos*
	rm -r "${S}"/plugins/dpa/DotFiles/linux-arm64

	jetbrains-ide_src_prepare
}
