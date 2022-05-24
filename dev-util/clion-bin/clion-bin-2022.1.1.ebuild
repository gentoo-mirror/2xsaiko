# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="C/C++ IDE"
HOMEPAGE="https://www.jetbrains.com/clion/"
SRC_URI="https://download.jetbrains.com/cpp/CLion-${PV}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

IDE_FULL_NAME="CLion"
IDE_BIN_NAME="clion"
IDE_DIST_NAME="clion"
