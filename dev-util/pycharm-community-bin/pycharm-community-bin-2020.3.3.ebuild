# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Python IDE for Professional Developers - Community Edition"
HOMEPAGE="https://www.jetbrains.com/pycharm/"
SRC_URI="https://download.jetbrains.com/python/pycharm-community-${PV}-no-jbr.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

IDE_FULL_NAME="PyCharm Community"
IDE_BIN_NAME="pycharm"
IDE_DIST_NAME="pycharm-community"
