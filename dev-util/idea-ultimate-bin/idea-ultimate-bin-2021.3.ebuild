# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Intelligent Java IDE"
HOMEPAGE="https://www.jetbrains.com/idea/"
SRC_URI="https://download.jetbrains.com/idea/ideaIU-${PV}-no-jbr.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

BDEPEND="dev-util/patchelf"

IDE_FULL_NAME="IntelliJ IDEA Ultimate"
IDE_BIN_NAME="idea"
IDE_DIST_NAME="idea-IU"
IDE_DIST_VERSION="any"

src_prepare() {
	patchelf --replace-needed liblldb.so.9 liblldb.so "${S}"/plugins/Kotlin/bin/linux/LLDBFrontend || die "Unable to patch LLDBFrontend for lldb"

	jetbrains-ide_src_prepare
}
