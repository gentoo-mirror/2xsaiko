# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_jdk_build="956.18"

DESCRIPTION="JetBrains JDK"
HOMEPAGE="https://github.com/JetBrains/JetBrainsRuntime"
SRC_URI="https://dl.bintray.com/jetbrains/intellij-jbr/jbrsdk-${PV//\./_}-linux-x64-b${_jdk_build}.tar.gz"

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

	insinto "/etc/profile.d"
	newins "${FILESDIR}/jbrsdk-r1.sh" jbrsdk.sh
}
