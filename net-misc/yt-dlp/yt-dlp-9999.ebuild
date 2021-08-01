# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit bash-completion-r1 distutils-r1 readme.gentoo-r1

DESCRIPTION="A youtube-dl fork with additional features and fixes"
HOMEPAGE="https://github.com/yt-dlp/yt-dlp"

if [[ "${PV}" = "9999" ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/yt-dlp/${PN}.git"
else
	SRC_URI="https://github.com/yt-dlp/yt-dlp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-solaris"
fi

LICENSE="public-domain"
SLOT="0"

RDEPEND="
	dev-python/pycryptodome[${PYTHON_USEDEP}]
"

distutils_enable_tests nose

src_prepare() {
	sed -i -e '/flake8/d' Makefile || die
	distutils-r1_src_prepare
}

src_compile() {
	distutils-r1_src_compile

	emake completions
}

python_test() {
	emake offlinetest
}

python_install_all() {
	# no manpage because it requires pandoc to generate

	dobashcomp completions/bash/yt-dlp

	insinto /usr/share/zsh/site-functions
	doins completions/zsh/_yt-dlp

	insinto /usr/share/fish/vendor_completions.d
	doins completions/fish/yt-dlp.fish

	distutils-r1_python_install_all

	rm -r "${ED}"/usr/share/doc/yt_dlp || die
}

pkg_postinst() {
	if ! has_version media-video/ffmpeg; then
		elog "${PN} works fine on its own on most sites. However, if you want"
		elog "to convert video/audio, you'll need media-video/ffmpeg."
		elog "On some sites - most notably YouTube - videos can be retrieved in"
		elog "a higher quality format without sound. ${PN} will detect whether"
		elog "ffmpeg is present and automatically pick the best option."
	fi
	if ! has_version media-video/rtmpdump; then
		elog
		elog "Videos or video formats streamed via RTMP protocol can only be"
		elog "downloaded when media-video/rtmpdump is installed."
	fi
	if ! has_version media-video/mplayer && ! has_version media-video/mpv; then
		elog
		elog "Downloading MMS and RTSP videos requires either media-video/mplayer"
		elog "or media-video/mpv to be installed."
	fi
	if ! has_version media-video/atomicparsley; then
		elog
		elog "Install media-video/atomicparsley if you want ${PN} to embed thumbnails"
		elog "from the metadata into the resulting MP4/M4A files."
	fi
}
