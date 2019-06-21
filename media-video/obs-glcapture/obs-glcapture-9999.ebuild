# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="GL capture for OBS"
HOMEPAGE="https://github.com/therealfarfetchd/obs-glcapture"
EGIT_REPO_URI="https://github.com/therealfarfetchd/obs-glcapture"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-video/obs-studio"
RDEPEND="${DEPEND} media-video/simplescreenrecorder"
BDEPEND=""

src_install() {
	insinto /usr/lib64/obs-plugins
	insopts -m644
	doins "${BUILD_DIR}/libobs-glcapture.so"
}
