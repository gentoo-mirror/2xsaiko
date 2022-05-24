# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit jetbrains-ide

DESCRIPTION="Cross-platform Ruby/Rails IDE"
HOMEPAGE="https://www.jetbrains.com/ruby/"
SRC_URI="https://download.jetbrains.com/ruby/RubyMine-${PV}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE=""

IDE_FULL_NAME="RubyMine"
IDE_BIN_NAME="rubymine"
IDE_DIST_NAME="RubyMine"
IDE_DIST_VERSION="any"
