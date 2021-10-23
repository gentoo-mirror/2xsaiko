# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="${PV%%_p*}"
MY_PV="${MY_PV//\./_}"
MY_BUILD="${PV#*_p}"
MY_BUILD="${MY_BUILD//_p/.}"

DESCRIPTION="JetBrains JDK"
HOMEPAGE="https://github.com/JetBrains/JetBrainsRuntime"
SRC_URI="
	amd64? ( https://cache-redirector.jetbrains.com/intellij-jbr/jbr_nomod-${MY_PV}-linux-x64-b${MY_BUILD}.tar.gz )
	x86? ( https://cache-redirector.jetbrains.com/intellij-jbr/jbr-${MY_PV}-linux-x86-b${MY_BUILD}.tar.gz )
	arm64? ( https://cache-redirector.jetbrains.com/intellij-jbr/jbr-${MY_PV}-linux-aarch64-b${MY_BUILD}.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/jbr"

RESTRICT="strip"

src_install() {
	dodir "/opt/${PN}"
	cp -pRP * "${ED}/opt/${PN}"
}
