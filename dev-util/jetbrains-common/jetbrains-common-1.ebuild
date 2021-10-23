# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Common setup for JetBrains IDEs"
HOMEPAGE="https://www.jetbrains.com/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-java/jetbrains-jre-bin-11.0.12
	dev-java/jansi-native
	dev-libs/libdbusmenu"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto "/etc/profile.d"
	newins "${FILESDIR}/jbrsdk.sh" jbrsdk.sh

	# recommended by: https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/" || die
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-idea-inotify-watches.conf" || die
}
