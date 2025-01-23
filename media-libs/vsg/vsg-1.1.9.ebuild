# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Vulkan & C++17 based Scene Graph Project"
HOMEPAGE="https://www.vulkanscenegraph.org/"

SRC_URI="https://github.com/vsg-dev/VulkanSceneGraph/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/VulkanSceneGraph-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-libs/vulkan-loader
	dev-util/glslang
"

DEPEND="${RDEPEND}"

BDEPEND="
	virtual/pkgconfig
"
