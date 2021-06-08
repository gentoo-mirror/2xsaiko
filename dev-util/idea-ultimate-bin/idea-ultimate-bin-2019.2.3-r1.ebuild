# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Intelligent Java IDE"
HOMEPAGE="https://www.jetbrains.com/idea/"
SRC_URI="https://download.jetbrains.com/idea/ideaIU-${PV}-no-jbr.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

IDE_FULL_NAME="IntelliJ IDEA Ultimate"
IDE_BIN_NAME="idea"
IDE_DIST_NAME="idea-IU"
IDE_DIST_VERSION="any"
