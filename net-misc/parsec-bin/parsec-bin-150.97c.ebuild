# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg

DESCRIPTION="Remote streaming service client"
HOMEPAGE="https://parsec.app/"
SRC_URI="https://web.archive.org/web/20250226223019/https://builds.parsec.app/package/parsec-linux.deb -> ${P}.deb"
RESTRICT="strip"

S="${WORKDIR}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/openssl
	media-libs/alsa-lib
	media-libs/jpeg-compat:8
	media-libs/libglvnd
	media-libs/libpng
	media-libs/libpulse
	media-libs/libva
	media-libs/vulkan-loader
	media-video/ffmpeg
	net-misc/curl
	virtual/libudev
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
"

QA_PREBUILT="usr/bin/parsecd"

src_install() {
	insinto /
	doins -r usr

	for f in ${QA_PREBUILT}; do
		fperms +x "/${f}"
	done
}
