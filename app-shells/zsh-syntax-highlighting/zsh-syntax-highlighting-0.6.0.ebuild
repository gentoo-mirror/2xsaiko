# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Fish shell like syntax highlighting for Zsh"
HOMEPAGE="https://github.com/zsh-users/zsh-syntax-highlighting"
SRC_URI="https://github.com/zsh-users/zsh-syntax-highlighting/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake
}

src_install() {
	emake PREFIX="/usr" SHARE_DIR="${D}/usr/share/zsh/plugins/${PN}" DESTDIR="${D}" install
}
