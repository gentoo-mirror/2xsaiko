# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Integration of VulkanSceneGraph with ImGui"
HOMEPAGE="https://github.com/vsg-dev/vsgImGui"

MY_IMGUI_VER="1.91.6"
MY_IMPLOT_HASH="f156599faefe316f7dd20fe6c783bf87c8bb6fd9"
MY_IMPLOT_DATE="20240122"

SRC_URI="
	https://github.com/vsg-dev/vsgImGui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ocornut/imgui/archive/refs/tags/v${MY_IMGUI_VER}.tar.gz -> imgui-${MY_IMGUI_VER}.tar.gz
	https://github.com/epezent/implot/archive/${MY_IMPLOT_HASH}.tar.gz -> implot-${MY_IMPLOT_DATE}.tar.gz
"

S="${WORKDIR}/vsgImGui-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-libs/vsg
"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
"

src_unpack() {
	default

	rmdir "${S}"/src/{imgui,implot}
	mv "${WORKDIR}"/imgui-"${MY_IMGUI_VER}" "${S}"/src/imgui
	mv "${WORKDIR}"/implot-"${MY_IMPLOT_HASH}" "${S}"/src/implot
}
