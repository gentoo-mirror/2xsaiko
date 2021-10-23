# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Cross-platform PHP IDE"
HOMEPAGE="https://www.jetbrains.com/phpstorm/"
SRC_URI="https://download.jetbrains.com/webide/PhpStorm-${PV}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

IDE_FULL_NAME="PhpStorm"
IDE_BIN_NAME="phpstorm"
IDE_DIST_NAME="PhpStorm"
IDE_DIST_VERSION="any"
