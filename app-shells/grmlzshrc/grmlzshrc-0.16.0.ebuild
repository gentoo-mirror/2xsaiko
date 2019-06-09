# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="grml's zsh setup"
HOMEPAGE="https://grml.org/zsh"
SRC_URI="https://deb.grml.org/pool/main/g/grml-etc-core/grml-etc-core_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-text/txt2tags"
RDEPEND=""
BDEPEND=""

S="${WORKDIR}/grml-etc-core-${PV}"

src_compile() {
	cd doc
	emake
}

src_install() {
	insopts -m644
	insinto /etc/skel
	doins etc/skel/.zshrc

	insinto /etc/zsh
	doins etc/zsh/keephack
	doins etc/zsh/zshrc

	doman doc/grmlzshrc.5
}
