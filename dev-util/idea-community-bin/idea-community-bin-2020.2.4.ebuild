# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Intelligent Java IDE - Community Edition"
HOMEPAGE="https://www.jetbrains.com/idea/"
SRC_URI="https://download.jetbrains.com/idea/ideaIC-${PV}-no-jbr.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="dev-util/patchelf"

IDE_FULL_NAME="IntelliJ IDEA Community"
IDE_BIN_NAME="idea"
IDE_DIST_NAME="idea-IC"
IDE_DIST_VERSION="any"

src_prepare() {
	patchelf --replace-needed liblldb.so.9 liblldb.so "${S}"/plugins/Kotlin/bin/linux/LLDBFrontend || die "Unable to patch LLDBFrontend for lldb"

	jetbrains-ide_src_prepare
}
