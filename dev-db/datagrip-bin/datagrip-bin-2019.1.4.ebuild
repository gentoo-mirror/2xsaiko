# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Client and query editor for multiple database backends"
HOMEPAGE="https://www.jetbrains.com/datagrip/"
SRC_URI="https://download.jetbrains.com/datagrip/datagrip-${PV}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

IDE_FULL_NAME="DataGrip"
IDE_BIN_NAME="datagrip"
IDE_DIST_NAME="DataGrip"
