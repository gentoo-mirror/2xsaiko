# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: npm2x.eclass
# @MAINTAINER:
# 2xsaiko <git@dblsaiko.net>
# @AUTHOR:
# 2xsaiko <git@dblsaiko.net>
# @BLURB: handle packages that need to be installed using npm install
# @DESCRIPTION:
# 

EXPORT_FUNCTIONS src_unpack src_compile

# @ECLASS-VARIABLE: NPM_MODULES
# @DESCRIPTION:
# Contains libraries to install into node_modules. This should contain all
# libraries, including recursive dependencies, followed by the install path of
# the module. These URLs also need to be added to SRC_URI manually.
#
# The way to get the content of this array is to extract the package yourself,
# then call npm install and then use the following command to get all the
# dependency URLs:
#
#     find node_modules -name package.json -exec jq -r '._resolved' {} \; -print |
#         xargs -n2 |
#         sed -E '/^null /d;s/ node_modules\/(.*)\/package.json/\t\1/'
#
# Beware, this could be a lot of lines so it is a good idea to save it to a
# temporary file instead of copying it from your terminal directly.
#
# @EXAMPLE:
#
# @CODE
# NPM_MODULES="
#     https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz	balanced-match
#     https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz	brace-expansion
#     https://registry.npmjs.org/clean-css/-/clean-css-4.1.11.tgz	clean-css
# "
# @CODE

# @ECLASS-VARIABLE: NPM-ARGS
# @DESCRIPTION:
# Arguments to pass to npm rebuild in src_compile.

BDEPEND="net-libs/nodejs[npm]"

npm2x_src_unpack() {
	npm2x_filter_archives
	default

	npm2x_src_unpack_modules
}

npm2x_src_compile() {
	npm rebuild ${NPM_ARGS}
}

# @FUNCTION: npm2x_set_globals
# @DESCRIPTION:
# Sets up the NPM_SRC_URI variable from NPM_MODULES.
npm2x_set_globals() {
	local pstate uri path tok
	NPM_SRC_URI=""
	_npm2x_sources_parse_init
	for tok in $NPM_MODULES; do
		if _npm2x_sources_parse "$tok"; then
			NPM_SRC_URI="${NPM_SRC_URI}${uri} "
		fi
	done
	_NPM2X_SET_GLOBALS_CALLED=1
}

# @FUNCTION: npm2x_src_filter_archives
# @DESCRIPTION:
# Strips out all the dependencies specified in $NPM_SRC_URI from $A.
#
# NB: This is hacky as fuck since $A is supposed to be read-only.
npm2x_filter_archives() {
	if [[ ! ${_NPM2X_SET_GLOBALS_CALLED} ]]; then
		die "npm2x_set_globals must be called in global scope"
	fi

	A="$(
		comm -23 \
			<(echo ${A} | xargs -n1 | sort) \
			<(echo ${NPM_SRC_URI} | xargs -n1 basename | sort)
	)"
}

# @FUNCTION: npm2x_src_unpack_modules
# @DESCRIPTION:
# Unpacks all the modules specified in $NPM_MODULES into the node_modules
# directory in $S. To customize this behavior, call npm2x_unpack_modules
# instead.
npm2x_src_unpack_modules() {
	cd "${S}"
	npm2x_unpack_modules "${NPM_MODULES}"
}

# @FUNCTION: npm2x_unpack_modules
# @USAGE: <sources>
# @DESCRIPTION:
# Unpacks the modules specified in sources into the node_modules directory.
#
# Syntax for sources is the same as NPM_MODULES.
npm2x_unpack_modules() {
	local pstate url path tok filename
	_npm2x_sources_parse_init
	for tok in $1; do
		if _npm2x_sources_parse "$tok"; then
			filename="$(basename "$uri")"
			ebegin "extracting $filename"
			mkdir -p "node_modules/$path" &&
				tar xf "${DISTDIR}/$filename" --strip-components=1 -C "node_modules/$path"
			eend $?
		fi
	done
}

_npm2x_sources_parse_init() {
	pstate=0
	uri=
	path=
}

_npm2x_sources_parse() {
	if [[ $pstate = 0 ]]; then
		uri="$1"
		pstate=1
		return 1
	else
		path="$1"
		pstate=0
		return 0
	fi
}

_npm2x_sources_end() {
	if [[ $pstate != 0 ]]; then
		eerror "unexpected EOF; check NPM_MODULES"
	fi
}
