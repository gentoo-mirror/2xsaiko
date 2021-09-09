# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

MY_PV="${PV}-10"

DESCRIPTION="Tool for creation of Nassi-Schneiderman Diagrams"
HOMEPAGE="https://structorizer.fisch.lu/"
SRC_URI="https://github.com/fesch/Structorizer.Desktop/releases/download/${MY_PV}/structorizer_${MY_PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="media-libs/libicns"
RDEPEND=">=virtual/jre-1.8"
BDEPEND="app-arch/unzip"

S="${WORKDIR}/Structorizer"

src_compile() {
	cd "${WORKDIR}"
	icns2png -x "${S}/Structorizer.app/Contents/Resources/Structorizer.icns"
}

src_install() {
	dodir /opt
	cp -a "${S}" "${ED}/opt/${PN}"
	newman Structorizer.1 "${PN}.1"
	dosym "../../opt/${PN}/structorizer.sh" "/usr/bin/${PN}"
	dosym "../../opt/${PN}/Arranger.sh" /usr/bin/arranger-bin

	newicon -s 16 "${WORKDIR}/Structorizer_16x16x32.png" "${PN}.png"
	newicon -s 32 "${WORKDIR}/Structorizer_32x32x32.png" "${PN}.png"
	newicon -s 128 "${WORKDIR}/Structorizer_128x128x32.png" "${PN}.png"
	newicon -s 256 "${WORKDIR}/Structorizer_256x256x32.png" "${PN}.png"
	newicon -s 512 "${WORKDIR}/Structorizer_512x512x32.png" "${PN}.png"

	rm "${ED}/opt/${PN}/"{Arranger.bat,Structorizer.1,Structorizer.bat,Structorizer.exe}
	rm -r "${ED}/opt/${PN}/Structorizer.app/Contents/"{MacOS,PlugIns,Resources,Info.plist,PkgInfo}
	make_desktop_entry "${PN}" "Structorizer" "" "Education;" "StartupWMClass=structorizer"
	make_desktop_entry "arranger-bin" "Arranger" "" "Education;" "StartupWMClass=structorizer"
}
