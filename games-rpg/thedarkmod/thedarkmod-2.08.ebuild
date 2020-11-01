# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop

DESCRIPTION="A first-person stealth video game inspired by the Thief series"
HOMEPAGE="https://www.thedarkmod.com"

# The list of game assets can be obtained by running the command
# curl -s "http://www.fidcal.com/darkuser/crc_info.txt" | awk -F ' |]' '/\[File .*pk4\]/ { print "mirror://tdmassets/"$2 }'
MY_ASSETS="
	mirror://tdmassets/fms/newjob/newjob.pk4
	mirror://tdmassets/fms/stlucia/stlucia.pk4
	mirror://tdmassets/fms/training_mission/training_mission.pk4
	mirror://tdmassets/tdm_ai_animals01.pk4
	mirror://tdmassets/tdm_ai_base01.pk4
	mirror://tdmassets/tdm_ai_humanoid_beasts01.pk4
	mirror://tdmassets/tdm_ai_humanoid_beasts02.pk4
	mirror://tdmassets/tdm_ai_humanoid_builders01.pk4
	mirror://tdmassets/tdm_ai_humanoid_females01.pk4
	mirror://tdmassets/tdm_ai_humanoid_guards01.pk4
	mirror://tdmassets/tdm_ai_humanoid_heads01.pk4
	mirror://tdmassets/tdm_ai_humanoid_mages01.pk4
	mirror://tdmassets/tdm_ai_humanoid_nobles01.pk4
	mirror://tdmassets/tdm_ai_humanoid_pagans01.pk4
	mirror://tdmassets/tdm_ai_humanoid_townsfolk01.pk4
	mirror://tdmassets/tdm_ai_humanoid_undead01.pk4
	mirror://tdmassets/tdm_ai_monsters_spiders01.pk4
	mirror://tdmassets/tdm_ai_steambots01.pk4
	mirror://tdmassets/tdm_base01.pk4
	mirror://tdmassets/tdm_defs01.pk4
	mirror://tdmassets/tdm_env01.pk4
	mirror://tdmassets/tdm_fonts01.pk4
	mirror://tdmassets/tdm_gui01.pk4
	mirror://tdmassets/tdm_gui_credits01.pk4
	mirror://tdmassets/tdm_models01.pk4
	mirror://tdmassets/tdm_models02.pk4
	mirror://tdmassets/tdm_models_decls01.pk4
	mirror://tdmassets/tdm_player01.pk4
	mirror://tdmassets/tdm_prefabs01.pk4
	mirror://tdmassets/tdm_sound_ambient01.pk4
	mirror://tdmassets/tdm_sound_ambient02.pk4
	mirror://tdmassets/tdm_sound_ambient03.pk4
	mirror://tdmassets/tdm_sound_ambient_decls01.pk4
	mirror://tdmassets/tdm_sound_sfx01.pk4
	mirror://tdmassets/tdm_sound_sfx02.pk4
	mirror://tdmassets/tdm_sound_vocals01.pk4
	mirror://tdmassets/tdm_sound_vocals02.pk4
	mirror://tdmassets/tdm_sound_vocals03.pk4
	mirror://tdmassets/tdm_sound_vocals04.pk4
	mirror://tdmassets/tdm_sound_vocals05.pk4
	mirror://tdmassets/tdm_sound_vocals06.pk4
	mirror://tdmassets/tdm_sound_vocals07.pk4
	mirror://tdmassets/tdm_sound_vocals_decls01.pk4
	mirror://tdmassets/tdm_standalone.pk4
	mirror://tdmassets/tdm_textures_base01.pk4
	mirror://tdmassets/tdm_textures_carpet01.pk4
	mirror://tdmassets/tdm_textures_decals01.pk4
	mirror://tdmassets/tdm_textures_door01.pk4
	mirror://tdmassets/tdm_textures_fabric01.pk4
	mirror://tdmassets/tdm_textures_glass01.pk4
	mirror://tdmassets/tdm_textures_metal01.pk4
	mirror://tdmassets/tdm_textures_nature01.pk4
	mirror://tdmassets/tdm_textures_other01.pk4
	mirror://tdmassets/tdm_textures_paint_paper01.pk4
	mirror://tdmassets/tdm_textures_plaster01.pk4
	mirror://tdmassets/tdm_textures_roof01.pk4
	mirror://tdmassets/tdm_textures_sfx01.pk4
	mirror://tdmassets/tdm_textures_stone_brick01.pk4
	mirror://tdmassets/tdm_textures_stone_cobblestones01.pk4
	mirror://tdmassets/tdm_textures_stone_flat01.pk4
	mirror://tdmassets/tdm_textures_stone_natural01.pk4
	mirror://tdmassets/tdm_textures_stone_sculpted01.pk4
	mirror://tdmassets/tdm_textures_window01.pk4
	mirror://tdmassets/tdm_textures_wood01.pk4
"

SRC_URI="
	https://www.thedarkmod.com/sources/thedarkmod.${PV}.src.7z
	${MY_ASSETS}"

PATCHES="${FILESDIR}/no-strip.patch"

LICENSE="BSD GPL-3+ CC-BY-NC-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="media-gfx/imagemagick[png]"

src_unpack() {
	mkdir "${S}"
	cd "${S}"

	unpack "thedarkmod.${PV}.src.7z"
}

src_prepare() {
	sed "s/__PKG_VER__/${PV}/g" "${FILESDIR}/thedarkmod-launch" > "${WORKDIR}/thedarkmod-launch"

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCOPY_EXE=0
	)

	cmake_src_configure
}

src_compile() {
	convert "${S}/tdm_update/TDM_icon.ico" "${WORKDIR}/${PN}.png"

	cmake_src_compile
}

src_install() {
	newbin "${WORKDIR}/thedarkmod-launch" "thedarkmod"

	insinto "/usr/share/${PN}"
	for asset in ${MY_ASSETS}; do
		src="${DISTDIR}/$(basename "${asset}")"
		dest="$(dirname "$(sed 's,mirror://tdmassets/,,' <<< "${asset}")")"
		insinto "/usr/share/${PN}/${dest}"
		doins "${src}"
	done

	insinto /usr/libexec
	insopts -m755
	newins "${BUILD_DIR}/thedarkmod.x64" "${PN}"

	doicon "${WORKDIR}/${PN}.png"
	make_desktop_entry "${PN}" "The Dark Mod" "${PN}"
}
