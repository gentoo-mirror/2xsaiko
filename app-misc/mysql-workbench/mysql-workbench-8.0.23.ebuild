# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Unified visual tool for database architects, developers, and DBAs"
HOMEPAGE="https://www.mysql.com/products/workbench/"
SRC_URI="
	https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-${PV}-src.tar.gz
	https://www.antlr.org/download/antlr-4.7.1-complete.jar"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-cpp/antlr-cpp:4
	dev-db/mysql-connector-c++:0/7
	dev-db/vsqlite++
	dev-libs/libzip
	dev-libs/rapidjson
	net-libs/libssh[server]
	sci-libs/gdal
	dev-cpp/gtkmm:3.0
	app-crypt/libsecret"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/mysql-workbench-community-${PV}-src"

src_unpack() {
	unpack "mysql-workbench-community-${PV}-src.tar.gz"
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DOpenGL_GL_PREFERENCE=GLVND
		-DANTLR_JAR_PATH="${DISTDIR}"
		-DLibSSH_LIBRARIES=ssh
	)

	cmake_src_configure
}
