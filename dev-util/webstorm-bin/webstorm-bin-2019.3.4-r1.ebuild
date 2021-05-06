# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="JavaScript IDE and HTML editor"
HOMEPAGE="https://www.jetbrains.com/webstorm/"
SRC_URI="https://download.jetbrains.com/webstorm/WebStorm-${PV}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

IDE_FULL_NAME="WebStorm"
IDE_BIN_NAME="webstorm"
IDE_DIST_NAME="WebStorm"
IDE_DIST_VERSION="any"
