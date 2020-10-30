# Copyright 2020 Gentoo Authors
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
	sci-libs/gdal"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/mysql-workbench-community-${PV}-src"

src_unpack() {
	unpack "mysql-workbench-community-${PV}-src.tar.gz"
}

src_prepare() {
	sed -i \
		-e 's/PythonLibs 2.6/Python2 COMPONENTS Development/' \
		-e 's/PYTHONLIBS_FOUND/Python2_FOUND/' \
		-e 's/find_program(PYTHON_EXEC "python2")/set(PYTHON_EXEC ${Python2_EXECUTABLE})/' \
		-e '/pkg_check_modules(PYTHON REQUIRED python)/d' \
		-e '/# We need to be able to/aset(PYTHON_INCLUDE_DIRS ${Python2_INCLUDE_DIRS})' \
		-e '/# We need to be able to/aset(PYTHON_LIBRARIES ${Python2_LIBRARIES})' \
		"${S}"/CMakeLists.txt

	sed -i 's/PYTHON_LIBRARIES/Python2_LIBRARIES/' "${S}"/library/grt/src/CMakeLists.txt

	sed -i '/#include <boost\/signals/ausing namespace boost::placeholders;' \
		"${S}"/library/forms/swig/mforms.i \
		"${S}"/modules/db.mysql.sqlparser/src/*.cpp

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
