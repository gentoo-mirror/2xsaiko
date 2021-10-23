# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Cross-platform IDE for Go"
HOMEPAGE="https://www.jetbrains.com/go/"
SRC_URI="https://download.jetbrains.com/go/goland-${PV}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

IDE_FULL_NAME="GoLand"
IDE_BIN_NAME="goland"
IDE_DIST_NAME="GoLand"
