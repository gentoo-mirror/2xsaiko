# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="A boxy 3D model editor"
HOMEPAGE="https://www.blockbench.net/"
SRC_URI="https://github.com/JannisX11/blockbench/releases/download/v${PV}/Blockbench_${PV}.deb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack ${A}
	mkdir ${P}
	cd ${P}
	unpack ../data.tar.xz
}

src_prepare() {
	default

	sed -i "s,/opt/Blockbench,/opt/${PN}," usr/share/applications/blockbench.desktop
	sed -i "s,Icon=blockbench,Icon=${PN}," usr/share/applications/blockbench.desktop

	gzip -d usr/share/doc/blockbench/changelog.gz
}

src_install() {
	dodir /opt
	cp -r "${S}/opt/Blockbench/" "${D}/opt/${PN}/"

	newmenu usr/share/applications/blockbench.desktop ${PN}.desktop
	dodoc usr/share/doc/blockbench/*
	newicon usr/share/icons/hicolor/0x0/apps/blockbench.png ${PN}.png

	dodir /usr/bin
	dosym -r /opt/${PN}/blockbench /usr/bin/${PN}
}
