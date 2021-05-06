# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_jdk_build="1398.1"
MY_PV="${PV//\./_}"

DESCRIPTION="JetBrains JDK"
HOMEPAGE="https://github.com/JetBrains/JetBrainsRuntime"
SRC_URI="https://dl.bintray.com/jetbrains/intellij-jbr/jbrsdk-${MY_PV}-linux-x64-b${_jdk_build}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/jbrsdk"

src_install() {
	dodir "/usr/lib/jvm/${PN}"
	cp -pRP * "${ED}/usr/lib/jvm/${PN}"
}
