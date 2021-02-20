# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit python-single-r1 npm2x

NPM_MODULES="
	https://registry.npmjs.org/lines-and-columns/-/lines-and-columns-1.1.6.tgz	lines-and-columns
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	postcss/node_modules/source-map
	https://registry.npmjs.org/postcss/-/postcss-8.1.10.tgz	postcss
	https://registry.npmjs.org/semver/-/semver-7.3.2.tgz	sass-loader/node_modules/semver
	https://registry.npmjs.org/loader-utils/-/loader-utils-2.0.0.tgz	sass-loader/node_modules/loader-utils
	https://registry.npmjs.org/schema-utils/-/schema-utils-3.0.0.tgz	sass-loader/node_modules/schema-utils
	https://registry.npmjs.org/sass-loader/-/sass-loader-10.1.0.tgz	sass-loader
	https://registry.npmjs.org/locate-path/-/locate-path-2.0.0.tgz	locate-path
	https://registry.npmjs.org/debug/-/debug-2.6.9.tgz	eslint-import-resolver-node/node_modules/debug
	https://registry.npmjs.org/ms/-/ms-2.0.0.tgz	eslint-import-resolver-node/node_modules/ms
	https://registry.npmjs.org/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.4.tgz	eslint-import-resolver-node
	https://registry.npmjs.org/esutils/-/esutils-2.0.3.tgz	esutils
	https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.2.1.tgz	is-arrayish
	https://registry.npmjs.org/chrome-trace-event/-/chrome-trace-event-1.0.2.tgz	chrome-trace-event
	https://registry.npmjs.org/pkg-dir/-/pkg-dir-2.0.0.tgz	pkg-dir
	https://registry.npmjs.org/execa/-/execa-4.1.0.tgz	execa
	https://registry.npmjs.org/param-case/-/param-case-3.0.3.tgz	param-case
	https://registry.npmjs.org/webpack-merge/-/webpack-merge-4.2.2.tgz	webpack-merge
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	clean-css/node_modules/source-map
	https://registry.npmjs.org/clean-css/-/clean-css-4.2.3.tgz	clean-css
	https://registry.npmjs.org/strip-json-comments/-/strip-json-comments-3.1.1.tgz	strip-json-comments
	https://registry.npmjs.org/debug/-/debug-2.6.9.tgz	eslint-plugin-import/node_modules/debug
	https://registry.npmjs.org/ms/-/ms-2.0.0.tgz	eslint-plugin-import/node_modules/ms
	https://registry.npmjs.org/doctrine/-/doctrine-1.5.0.tgz	eslint-plugin-import/node_modules/doctrine
	https://registry.npmjs.org/eslint-plugin-import/-/eslint-plugin-import-2.22.1.tgz	eslint-plugin-import
	https://registry.npmjs.org/ajv-keywords/-/ajv-keywords-3.5.2.tgz	ajv-keywords
	https://registry.npmjs.org/path-parse/-/path-parse-1.0.6.tgz	path-parse
	https://registry.npmjs.org/lower-case/-/lower-case-2.0.1.tgz	lower-case
	https://registry.npmjs.org/emojis-list/-/emojis-list-3.0.0.tgz	emojis-list
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.0.tgz	strip-ansi
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.0.tgz	ansi-regex
	https://registry.npmjs.org/string.prototype.trimstart/-/string.prototype.trimstart-1.0.3.tgz	string.prototype.trimstart
	https://registry.npmjs.org/type-fest/-/type-fest-0.8.1.tgz	type-fest
	https://registry.npmjs.org/node-releases/-/node-releases-1.1.67.tgz	node-releases
	https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz	fast-json-stable-stringify
	https://registry.npmjs.org/eslint-plugin-jquery/-/eslint-plugin-jquery-1.5.1.tgz	eslint-plugin-jquery
	https://registry.npmjs.org/table/-/table-5.4.6.tgz	table
	https://registry.npmjs.org/strip-final-newline/-/strip-final-newline-2.0.0.tgz	strip-final-newline
	https://registry.npmjs.org/has/-/has-1.0.3.tgz	has
	https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz	concat-map
	https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz	jest-worker/node_modules/has-flag
	https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz	jest-worker/node_modules/supports-color
	https://registry.npmjs.org/jest-worker/-/jest-worker-26.6.2.tgz	jest-worker
	https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.3.607.tgz	electron-to-chromium
	https://registry.npmjs.org/globals/-/globals-11.12.0.tgz	globals
	https://registry.npmjs.org/estraverse/-/estraverse-5.2.0.tgz	esquery/node_modules/estraverse
	https://registry.npmjs.org/esquery/-/esquery-1.3.1.tgz	esquery
	https://registry.npmjs.org/path-type/-/path-type-4.0.0.tgz	path-type
	https://registry.npmjs.org/debug/-/debug-4.3.1.tgz	debug
	https://registry.npmjs.org/colorette/-/colorette-1.2.1.tgz	colorette
	https://registry.npmjs.org/icss-utils/-/icss-utils-5.1.0.tgz	icss-utils
	https://registry.npmjs.org/onetime/-/onetime-5.1.2.tgz	onetime
	https://registry.npmjs.org/globals/-/globals-12.4.0.tgz	@eslint/eslintrc/node_modules/globals
	https://registry.npmjs.org/@eslint/eslintrc/-/eslintrc-0.2.1.tgz	@eslint/eslintrc
	https://registry.npmjs.org/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz	validate-npm-package-license
	https://registry.npmjs.org/is-date-object/-/is-date-object-1.0.2.tgz	is-date-object
	https://registry.npmjs.org/tapable/-/tapable-1.1.3.tgz	tapable
	https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz	wrappy
	https://registry.npmjs.org/slice-ansi/-/slice-ansi-2.1.0.tgz	slice-ansi
	https://registry.npmjs.org/entities/-/entities-1.1.2.tgz	htmlparser2/node_modules/entities
	https://registry.npmjs.org/htmlparser2/-/htmlparser2-3.10.1.tgz	htmlparser2
	https://registry.npmjs.org/astral-regex/-/astral-regex-1.0.0.tgz	astral-regex
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	source-map-support/node_modules/source-map
	https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.19.tgz	source-map-support
	https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz	webpack/node_modules/locate-path
	https://registry.npmjs.org/pkg-dir/-/pkg-dir-4.2.0.tgz	webpack/node_modules/pkg-dir
	https://registry.npmjs.org/tapable/-/tapable-2.1.1.tgz	webpack/node_modules/tapable
	https://registry.npmjs.org/webpack-sources/-/webpack-sources-2.2.0.tgz	webpack/node_modules/webpack-sources
	https://registry.npmjs.org/find-up/-/find-up-4.1.0.tgz	webpack/node_modules/find-up
	https://registry.npmjs.org/acorn/-/acorn-8.0.4.tgz	webpack/node_modules/acorn
	https://registry.npmjs.org/p-locate/-/p-locate-4.1.0.tgz	webpack/node_modules/p-locate
	https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz	webpack/node_modules/path-exists
	https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz	webpack/node_modules/p-limit
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	webpack/node_modules/source-map
	https://registry.npmjs.org/eslint-scope/-/eslint-scope-5.1.1.tgz	webpack/node_modules/eslint-scope
	https://registry.npmjs.org/schema-utils/-/schema-utils-3.0.0.tgz	webpack/node_modules/schema-utils
	https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz	webpack/node_modules/p-try
	https://registry.npmjs.org/webpack/-/webpack-5.6.0.tgz	webpack
	https://registry.npmjs.org/is-negative-zero/-/is-negative-zero-2.0.0.tgz	is-negative-zero
	https://registry.npmjs.org/acorn-jsx/-/acorn-jsx-5.3.1.tgz	acorn-jsx
	https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz	imurmurhash
	https://registry.npmjs.org/serialize-javascript/-/serialize-javascript-5.0.1.tgz	serialize-javascript
	https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.13.7.tgz	regenerator-runtime
	https://registry.npmjs.org/postcss-modules-values/-/postcss-modules-values-4.0.0.tgz	postcss-modules-values
	https://registry.npmjs.org/object-keys/-/object-keys-1.1.1.tgz	object-keys
	https://registry.npmjs.org/jsesc/-/jsesc-2.5.2.tgz	jsesc
	https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz	inflight
	https://registry.npmjs.org/relateurl/-/relateurl-0.2.7.tgz	relateurl
	https://registry.npmjs.org/estraverse/-/estraverse-4.3.0.tgz	estraverse
	https://registry.npmjs.org/commander/-/commander-6.2.0.tgz	webpack-cli/node_modules/commander
	https://registry.npmjs.org/webpack-cli/-/webpack-cli-4.2.0.tgz	webpack-cli
	https://registry.npmjs.org/browserslist/-/browserslist-4.14.7.tgz	browserslist
	https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz	get-stream
	https://registry.npmjs.org/nanoid/-/nanoid-3.1.18.tgz	nanoid
	https://registry.npmjs.org/npm-run-path/-/npm-run-path-4.0.1.tgz	npm-run-path
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	webpack-sources/node_modules/source-map
	https://registry.npmjs.org/webpack-sources/-/webpack-sources-1.4.3.tgz	webpack-sources
	https://registry.npmjs.org/eslint-utils/-/eslint-utils-2.1.0.tgz	eslint-utils
	https://registry.npmjs.org/bootswatch/-/bootswatch-4.5.3.tgz	bootswatch
	https://registry.npmjs.org/jquery-migrate/-/jquery-migrate-3.3.2.tgz	jquery-migrate
	https://registry.npmjs.org/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz	functional-red-black-tree
	https://registry.npmjs.org/jquery/-/jquery-3.5.1.tgz	jquery
	https://registry.npmjs.org/type-check/-/type-check-0.4.0.tgz	type-check
	https://registry.npmjs.org/spdx-correct/-/spdx-correct-3.1.1.tgz	spdx-correct
	https://registry.npmjs.org/estraverse/-/estraverse-5.2.0.tgz	esrecurse/node_modules/estraverse
	https://registry.npmjs.org/esrecurse/-/esrecurse-4.3.0.tgz	esrecurse
	https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz	fill-range
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz	ansi-styles
	https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-1.3.0.tgz	eslint-visitor-keys
	https://registry.npmjs.org/regextras/-/regextras-0.7.1.tgz	regextras
	https://registry.npmjs.org/find-up/-/find-up-2.1.0.tgz	find-up
	https://registry.npmjs.org/ajv/-/ajv-6.12.6.tgz	ajv
	https://registry.npmjs.org/domelementtype/-/domelementtype-1.3.1.tgz	domelementtype
	https://registry.npmjs.org/babel-plugin-dynamic-import-node/-/babel-plugin-dynamic-import-node-2.3.3.tgz	babel-plugin-dynamic-import-node
	https://registry.npmjs.org/is-callable/-/is-callable-1.2.2.tgz	is-callable
	https://registry.npmjs.org/acorn/-/acorn-7.4.1.tgz	acorn
	https://registry.npmjs.org/is-glob/-/is-glob-4.0.1.tgz	is-glob
	https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz	callsites
	https://registry.npmjs.org/reduce-flatten/-/reduce-flatten-2.0.0.tgz	reduce-flatten
	https://registry.npmjs.org/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-1.0.4.tgz	unicode-match-property-ecmascript
	https://registry.npmjs.org/postcss-modules-local-by-default/-/postcss-modules-local-by-default-4.0.0.tgz	postcss-modules-local-by-default
	https://registry.npmjs.org/typical/-/typical-5.2.0.tgz	typical
	https://registry.npmjs.org/mimic-fn/-/mimic-fn-2.1.0.tgz	mimic-fn
	https://registry.npmjs.org/sass/-/sass-1.29.0.tgz	sass
	https://registry.npmjs.org/debug/-/debug-2.6.9.tgz	eslint-module-utils/node_modules/debug
	https://registry.npmjs.org/ms/-/ms-2.0.0.tgz	eslint-module-utils/node_modules/ms
	https://registry.npmjs.org/eslint-module-utils/-/eslint-module-utils-2.6.0.tgz	eslint-module-utils
	https://registry.npmjs.org/merge-stream/-/merge-stream-2.0.0.tgz	merge-stream
	https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz	isarray
	https://registry.npmjs.org/prelude-ls/-/prelude-ls-1.2.1.tgz	prelude-ls
	https://registry.npmjs.org/once/-/once-1.4.0.tgz	once
	https://registry.npmjs.org/ms/-/ms-2.1.2.tgz	ms
	https://registry.npmjs.org/commander/-/commander-4.1.1.tgz	commander
	https://registry.npmjs.org/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-1.1.0.tgz	unicode-property-aliases-ecmascript
	https://registry.npmjs.org/@xtuc/ieee754/-/ieee754-1.2.0.tgz	@xtuc/ieee754
	https://registry.npmjs.org/@xtuc/long/-/long-4.2.2.tgz	@xtuc/long
	https://registry.npmjs.org/postcss-modules-extract-imports/-/postcss-modules-extract-imports-3.0.0.tgz	postcss-modules-extract-imports
	https://registry.npmjs.org/commondir/-/commondir-1.0.1.tgz	commondir
	https://registry.npmjs.org/semver/-/semver-5.7.1.tgz	semver
	https://registry.npmjs.org/word-wrap/-/word-wrap-1.2.3.tgz	word-wrap
	https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.0.1.tgz	get-intrinsic
	https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz	fs.realpath
	https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz	is-binary-path
	https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz	to-regex-range
	https://registry.npmjs.org/define-properties/-/define-properties-1.1.3.tgz	define-properties
	https://registry.npmjs.org/levn/-/levn-0.4.1.tgz	levn
	https://registry.npmjs.org/utila/-/utila-0.4.0.tgz	utila
	https://registry.npmjs.org/which/-/which-2.0.2.tgz	which
	https://registry.npmjs.org/json5/-/json5-1.0.1.tgz	loader-utils/node_modules/json5
	https://registry.npmjs.org/loader-utils/-/loader-utils-1.4.0.tgz	loader-utils
	https://registry.npmjs.org/tslib/-/tslib-1.14.1.tgz	tslib
	https://registry.npmjs.org/convert-source-map/-/convert-source-map-1.7.0.tgz	convert-source-map
	https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz	is-number
	https://registry.npmjs.org/envinfo/-/envinfo-7.7.3.tgz	envinfo
	https://registry.npmjs.org/interpret/-/interpret-2.2.0.tgz	interpret
	https://registry.npmjs.org/watchpack/-/watchpack-2.0.1.tgz	watchpack
	https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz	is-extglob
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-7.0.3.tgz	emoji-regex
	https://registry.npmjs.org/enquirer/-/enquirer-2.3.6.tgz	enquirer
	https://registry.npmjs.org/is-regex/-/is-regex-1.1.1.tgz	is-regex
	https://registry.npmjs.org/@types/tapable/-/tapable-1.0.6.tgz	@types/tapable
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	@types/webpack/node_modules/source-map
	https://registry.npmjs.org/@types/webpack/-/webpack-4.41.25.tgz	@types/webpack
	https://registry.npmjs.org/source-map/-/source-map-0.7.3.tgz	@types/webpack-sources/node_modules/source-map
	https://registry.npmjs.org/@types/webpack-sources/-/webpack-sources-2.0.0.tgz	@types/webpack-sources
	https://registry.npmjs.org/@types/node/-/node-14.14.9.tgz	@types/node
	https://registry.npmjs.org/@types/json-schema/-/json-schema-7.0.6.tgz	@types/json-schema
	https://registry.npmjs.org/@types/estree/-/estree-0.0.45.tgz	@types/estree
	https://registry.npmjs.org/@types/json5/-/json5-0.0.29.tgz	@types/json5
	https://registry.npmjs.org/@types/source-list-map/-/source-list-map-0.1.2.tgz	@types/source-list-map
	https://registry.npmjs.org/@types/eslint/-/eslint-7.2.5.tgz	@types/eslint
	https://registry.npmjs.org/@types/anymatch/-/anymatch-1.3.1.tgz	@types/anymatch
	https://registry.npmjs.org/@types/parse-json/-/parse-json-4.0.0.tgz	@types/parse-json
	https://registry.npmjs.org/@types/eslint-scope/-/eslint-scope-3.7.0.tgz	@types/eslint-scope
	https://registry.npmjs.org/@types/html-minifier-terser/-/html-minifier-terser-5.1.1.tgz	@types/html-minifier-terser
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	@types/uglify-js/node_modules/source-map
	https://registry.npmjs.org/@types/uglify-js/-/uglify-js-3.11.1.tgz	@types/uglify-js
	https://registry.npmjs.org/es-abstract/-/es-abstract-1.18.0-next.1.tgz	es-abstract
	https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz	path-key
	https://registry.npmjs.org/events/-/events-3.2.0.tgz	events
	https://registry.npmjs.org/object-inspect/-/object-inspect-1.8.0.tgz	object-inspect
	https://registry.npmjs.org/deep-is/-/deep-is-0.1.3.tgz	deep-is
	https://registry.npmjs.org/camelcase/-/camelcase-6.2.0.tgz	camelcase
	https://registry.npmjs.org/json5/-/json5-2.1.3.tgz	json5
	https://registry.npmjs.org/popper.js/-/popper.js-1.16.1.tgz	popper.js
	https://registry.npmjs.org/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz	json-stable-stringify-without-jsonify
	https://registry.npmjs.org/es-abstract/-/es-abstract-1.17.7.tgz	object.values/node_modules/es-abstract
	https://registry.npmjs.org/object.values/-/object.values-1.1.1.tgz	object.values
	https://registry.npmjs.org/normalize-package-data/-/normalize-package-data-2.5.0.tgz	normalize-package-data
	https://registry.npmjs.org/ansi-colors/-/ansi-colors-4.1.1.tgz	ansi-colors
	https://registry.npmjs.org/randombytes/-/randombytes-2.1.0.tgz	randombytes
	https://registry.npmjs.org/cssesc/-/cssesc-3.0.0.tgz	cssesc
	https://registry.npmjs.org/readdirp/-/readdirp-3.5.0.tgz	readdirp
	https://registry.npmjs.org/tapable/-/tapable-2.1.1.tgz	enhanced-resolve/node_modules/tapable
	https://registry.npmjs.org/enhanced-resolve/-/enhanced-resolve-5.3.2.tgz	enhanced-resolve
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz	balanced-match
	https://registry.npmjs.org/source-list-map/-/source-list-map-2.0.1.tgz	source-list-map
	https://registry.npmjs.org/pascal-case/-/pascal-case-3.1.1.tgz	pascal-case
	https://registry.npmjs.org/cosmiconfig/-/cosmiconfig-7.0.0.tgz	cosmiconfig
	https://registry.npmjs.org/indexes-of/-/indexes-of-1.0.1.tgz	indexes-of
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz	is-fullwidth-code-point
	https://registry.npmjs.org/p-locate/-/p-locate-2.0.0.tgz	p-locate
	https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz	argparse
	https://registry.npmjs.org/spdx-license-ids/-/spdx-license-ids-3.0.6.tgz	spdx-license-ids
	https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz	import-local/node_modules/locate-path
	https://registry.npmjs.org/pkg-dir/-/pkg-dir-4.2.0.tgz	import-local/node_modules/pkg-dir
	https://registry.npmjs.org/find-up/-/find-up-4.1.0.tgz	import-local/node_modules/find-up
	https://registry.npmjs.org/p-locate/-/p-locate-4.1.0.tgz	import-local/node_modules/p-locate
	https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz	import-local/node_modules/path-exists
	https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz	import-local/node_modules/p-limit
	https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz	import-local/node_modules/p-try
	https://registry.npmjs.org/import-local/-/import-local-3.0.2.tgz	import-local
	https://registry.npmjs.org/bootstrap/-/bootstrap-4.5.3.tgz	bootstrap
	https://registry.npmjs.org/uniq/-/uniq-1.0.1.tgz	uniq
	https://registry.npmjs.org/file-entry-cache/-/file-entry-cache-5.0.1.tgz	file-entry-cache
	https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz	minimist
	https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.1.tgz	has-symbols
	https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz	js-tokens
	https://registry.npmjs.org/resolve-from/-/resolve-from-5.0.0.tgz	resolve-cwd/node_modules/resolve-from
	https://registry.npmjs.org/resolve-cwd/-/resolve-cwd-3.0.0.tgz	resolve-cwd
	https://registry.npmjs.org/comment-parser/-/comment-parser-0.7.6.tgz	comment-parser
	https://registry.npmjs.org/camel-case/-/camel-case-4.1.1.tgz	camel-case
	https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.1.tgz	buffer-from
	https://registry.npmjs.org/lodash/-/lodash-4.17.20.tgz	lodash
	https://registry.npmjs.org/table-layout/-/table-layout-1.0.1.tgz	table-layout
	https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz	json-schema-traverse
	https://registry.npmjs.org/es-abstract/-/es-abstract-1.17.7.tgz	object.getownpropertydescriptors/node_modules/es-abstract
	https://registry.npmjs.org/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.0.tgz	object.getownpropertydescriptors
	https://registry.npmjs.org/write/-/write-1.0.3.tgz	write
	https://registry.npmjs.org/postcss-modules-scope/-/postcss-modules-scope-3.0.0.tgz	postcss-modules-scope
	https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.0.tgz	js-yaml
	https://registry.npmjs.org/klona/-/klona-2.0.4.tgz	klona
	https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz	function-bind
	https://registry.npmjs.org/read-pkg-up/-/read-pkg-up-2.0.0.tgz	read-pkg-up
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-5.2.0.tgz	string-width/node_modules/strip-ansi
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-4.1.0.tgz	string-width/node_modules/ansi-regex
	https://registry.npmjs.org/string-width/-/string-width-3.1.0.tgz	string-width
	https://registry.npmjs.org/optionator/-/optionator-0.9.1.tgz	optionator
	https://registry.npmjs.org/leven/-/leven-3.1.0.tgz	leven
	https://registry.npmjs.org/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz	json-parse-better-errors
	https://registry.npmjs.org/object.assign/-/object.assign-4.1.2.tgz	object.assign
	https://registry.npmjs.org/regenerate/-/regenerate-1.4.2.tgz	regenerate
	https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz	color-convert
	https://registry.npmjs.org/import-fresh/-/import-fresh-3.2.2.tgz	import-fresh
	https://registry.npmjs.org/css-select/-/css-select-1.2.0.tgz	css-select
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz	renderkid/node_modules/strip-ansi
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz	renderkid/node_modules/ansi-regex
	https://registry.npmjs.org/renderkid/-/renderkid-2.0.4.tgz	renderkid
	https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz	path-exists
	https://registry.npmjs.org/array-includes/-/array-includes-3.1.2.tgz	array-includes
	https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz	cross-spawn
	https://registry.npmjs.org/globals/-/globals-12.4.0.tgz	eslint/node_modules/globals
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz	eslint/node_modules/ansi-styles
	https://registry.npmjs.org/eslint-visitor-keys/-/eslint-visitor-keys-2.0.0.tgz	eslint/node_modules/eslint-visitor-keys
	https://registry.npmjs.org/semver/-/semver-7.3.2.tgz	eslint/node_modules/semver
	https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz	eslint/node_modules/color-convert
	https://registry.npmjs.org/chalk/-/chalk-4.1.0.tgz	eslint/node_modules/chalk
	https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz	eslint/node_modules/has-flag
	https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz	eslint/node_modules/color-name
	https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz	eslint/node_modules/supports-color
	https://registry.npmjs.org/eslint-scope/-/eslint-scope-5.1.1.tgz	eslint/node_modules/eslint-scope
	https://registry.npmjs.org/eslint/-/eslint-7.14.0.tgz	eslint
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz	brace-expansion
	https://registry.npmjs.org/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-1.2.0.tgz	unicode-match-property-value-ecmascript
	https://registry.npmjs.org/command-line-usage/-/command-line-usage-6.1.1.tgz	command-line-usage
	https://registry.npmjs.org/semver/-/semver-7.0.0.tgz	core-js-compat/node_modules/semver
	https://registry.npmjs.org/core-js-compat/-/core-js-compat-3.7.0.tgz	core-js-compat
	https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz	punycode
	https://registry.npmjs.org/nth-check/-/nth-check-1.0.2.tgz	nth-check
	https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.1.0.tgz	binary-extensions
	https://registry.npmjs.org/@webpack-cli/serve/-/serve-1.1.0.tgz	@webpack-cli/serve
	https://registry.npmjs.org/@webpack-cli/info/-/info-1.1.0.tgz	@webpack-cli/info
	https://registry.npmjs.org/jsdoctypeparser/-/jsdoctypeparser-9.0.0.tgz	jsdoctypeparser
	https://registry.npmjs.org/semver/-/semver-7.3.2.tgz	postcss-loader/node_modules/semver
	https://registry.npmjs.org/loader-utils/-/loader-utils-2.0.0.tgz	postcss-loader/node_modules/loader-utils
	https://registry.npmjs.org/schema-utils/-/schema-utils-3.0.0.tgz	postcss-loader/node_modules/schema-utils
	https://registry.npmjs.org/postcss-loader/-/postcss-loader-4.1.0.tgz	postcss-loader
	https://registry.npmjs.org/is-core-module/-/is-core-module-2.1.0.tgz	is-core-module
	https://registry.npmjs.org/jsesc/-/jsesc-0.5.0.tgz	regjsparser/node_modules/jsesc
	https://registry.npmjs.org/regjsparser/-/regjsparser-0.6.4.tgz	regjsparser
	https://registry.npmjs.org/es-to-primitive/-/es-to-primitive-1.2.1.tgz	es-to-primitive
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz	string_decoder/node_modules/safe-buffer
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz	string_decoder
	https://registry.npmjs.org/pump/-/pump-3.0.0.tgz	pump
	https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001161.tgz	caniuse-lite
	https://registry.npmjs.org/regenerator-transform/-/regenerator-transform-0.14.5.tgz	regenerator-transform
	https://registry.npmjs.org/json5/-/json5-1.0.1.tgz	tsconfig-paths/node_modules/json5
	https://registry.npmjs.org/tsconfig-paths/-/tsconfig-paths-3.9.0.tgz	tsconfig-paths
	https://registry.npmjs.org/postcss-value-parser/-/postcss-value-parser-4.1.0.tgz	postcss-value-parser
	https://registry.npmjs.org/eslint-rule-composer/-/eslint-rule-composer-0.3.0.tgz	eslint-rule-composer
	https://registry.npmjs.org/html-webpack-plugin/-/html-webpack-plugin-4.5.0.tgz	html-webpack-plugin
	https://registry.npmjs.org/regjsgen/-/regjsgen-0.5.2.tgz	regjsgen
	https://registry.npmjs.org/@fortawesome/free-solid-svg-icons/-/free-solid-svg-icons-5.15.1.tgz	@fortawesome/free-solid-svg-icons
	https://registry.npmjs.org/@fortawesome/fontawesome-svg-core/-/fontawesome-svg-core-1.2.32.tgz	@fortawesome/fontawesome-svg-core
	https://registry.npmjs.org/@fortawesome/free-regular-svg-icons/-/free-regular-svg-icons-5.15.1.tgz	@fortawesome/free-regular-svg-icons
	https://registry.npmjs.org/@fortawesome/fontawesome-common-types/-/fontawesome-common-types-0.2.32.tgz	@fortawesome/fontawesome-common-types
	https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz	escalade
	https://registry.npmjs.org/regexpp/-/regexpp-3.1.0.tgz	regexpp
	https://registry.npmjs.org/path-type/-/path-type-2.0.0.tgz	read-pkg/node_modules/path-type
	https://registry.npmjs.org/pify/-/pify-2.3.0.tgz	read-pkg/node_modules/pify
	https://registry.npmjs.org/read-pkg/-/read-pkg-2.0.0.tgz	read-pkg
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz	safe-buffer
	https://registry.npmjs.org/mime-db/-/mime-db-1.44.0.tgz	mime-db
	https://registry.npmjs.org/yaml/-/yaml-1.10.0.tgz	yaml
	https://registry.npmjs.org/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz	glob-to-regexp
	https://registry.npmjs.org/domhandler/-/domhandler-2.4.2.tgz	domhandler
	https://registry.npmjs.org/util.promisify/-/util.promisify-1.0.0.tgz	util.promisify
	https://registry.npmjs.org/rimraf/-/rimraf-2.6.3.tgz	rimraf
	https://registry.npmjs.org/anymatch/-/anymatch-3.1.1.tgz	anymatch
	https://registry.npmjs.org/domelementtype/-/domelementtype-2.0.2.tgz	dom-serializer/node_modules/domelementtype
	https://registry.npmjs.org/dom-serializer/-/dom-serializer-0.2.2.tgz	dom-serializer
	https://registry.npmjs.org/chokidar/-/chokidar-3.4.3.tgz	chokidar
	https://registry.npmjs.org/glob/-/glob-7.1.6.tgz	glob
	https://registry.npmjs.org/human-signals/-/human-signals-1.1.1.tgz	human-signals
	https://registry.npmjs.org/entities/-/entities-2.1.0.tgz	entities
	https://registry.npmjs.org/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz	fast-levenshtein
	https://registry.npmjs.org/fsevents/-/fsevents-2.1.3.tgz	fsevents
	https://registry.npmjs.org/strip-bom/-/strip-bom-3.0.0.tgz	strip-bom
	https://registry.npmjs.org/uri-js/-/uri-js-4.4.0.tgz	uri-js
	https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz	inherits
	https://registry.npmjs.org/core-js/-/core-js-3.7.0.tgz	core-js
	https://registry.npmjs.org/to-fast-properties/-/to-fast-properties-2.0.0.tgz	to-fast-properties
	https://registry.npmjs.org/num2fraction/-/num2fraction-1.2.2.tgz	num2fraction
	https://registry.npmjs.org/is-symbol/-/is-symbol-1.0.3.tgz	is-symbol
	https://registry.npmjs.org/dom-converter/-/dom-converter-0.2.0.tgz	dom-converter
	https://registry.npmjs.org/flatted/-/flatted-2.0.2.tgz	flatted
	https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz	chalk
	https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz	make-dir
	https://registry.npmjs.org/parse-json/-/parse-json-2.2.0.tgz	load-json-file/node_modules/parse-json
	https://registry.npmjs.org/pify/-/pify-2.3.0.tgz	load-json-file/node_modules/pify
	https://registry.npmjs.org/load-json-file/-/load-json-file-2.0.0.tgz	load-json-file
	https://registry.npmjs.org/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-1.0.4.tgz	unicode-canonical-property-names-ecmascript
	https://registry.npmjs.org/pretty-error/-/pretty-error-2.1.2.tgz	pretty-error
	https://registry.npmjs.org/doctrine/-/doctrine-3.0.0.tgz	doctrine
	https://registry.npmjs.org/error-ex/-/error-ex-1.3.2.tgz	error-ex
	https://registry.npmjs.org/call-bind/-/call-bind-1.0.0.tgz	call-bind
	https://registry.npmjs.org/commander/-/commander-2.20.3.tgz	terser/node_modules/commander
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	terser/node_modules/source-map
	https://registry.npmjs.org/terser/-/terser-4.8.0.tgz	terser
	https://registry.npmjs.org/array.prototype.flat/-/array.prototype.flat-1.2.4.tgz	array.prototype.flat
	https://registry.npmjs.org/hosted-git-info/-/hosted-git-info-2.8.8.tgz	hosted-git-info
	https://registry.npmjs.org/semver/-/semver-7.3.2.tgz	css-loader/node_modules/semver
	https://registry.npmjs.org/loader-utils/-/loader-utils-2.0.0.tgz	css-loader/node_modules/loader-utils
	https://registry.npmjs.org/schema-utils/-/schema-utils-3.0.0.tgz	css-loader/node_modules/schema-utils
	https://registry.npmjs.org/css-loader/-/css-loader-5.0.1.tgz	css-loader
	https://registry.npmjs.org/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz	spdx-exceptions
	https://registry.npmjs.org/domutils/-/domutils-1.5.1.tgz	domutils
	https://registry.npmjs.org/p-limit/-/p-limit-1.3.0.tgz	p-limit
	https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz	fast-deep-equal
	https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.4.tgz	graceful-fs
	https://registry.npmjs.org/loader-utils/-/loader-utils-2.0.0.tgz	mini-css-extract-plugin/node_modules/loader-utils
	https://registry.npmjs.org/schema-utils/-/schema-utils-3.0.0.tgz	mini-css-extract-plugin/node_modules/schema-utils
	https://registry.npmjs.org/mini-css-extract-plugin/-/mini-css-extract-plugin-1.3.1.tgz	mini-css-extract-plugin
	https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.1.tgz	glob-parent
	https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz	has-flag
	https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz	color-name
	https://registry.npmjs.org/is-stream/-/is-stream-2.0.0.tgz	is-stream
	https://registry.npmjs.org/v8-compile-cache/-/v8-compile-cache-2.2.0.tgz	v8-compile-cache
	https://registry.npmjs.org/neo-async/-/neo-async-2.6.2.tgz	neo-async
	https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz	source-map
	https://registry.npmjs.org/gensync/-/gensync-1.0.0-beta.2.tgz	gensync
	https://registry.npmjs.org/flat-cache/-/flat-cache-2.0.1.tgz	flat-cache
	https://registry.npmjs.org/autoprefixer/-/autoprefixer-10.0.2.tgz	autoprefixer
	https://registry.npmjs.org/text-table/-/text-table-0.2.0.tgz	text-table
	https://registry.npmjs.org/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz	spdx-expression-parse
	https://registry.npmjs.org/deep-extend/-/deep-extend-0.6.0.tgz	deep-extend
	https://registry.npmjs.org/semver/-/semver-6.3.0.tgz	@babel/eslint-parser/node_modules/semver
	https://registry.npmjs.org/@babel/eslint-parser/-/eslint-parser-7.12.1.tgz	@babel/eslint-parser
	https://registry.npmjs.org/@babel/helper-simple-access/-/helper-simple-access-7.12.1.tgz	@babel/helper-simple-access
	https://registry.npmjs.org/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz	@babel/plugin-syntax-optional-catch-binding
	https://registry.npmjs.org/@babel/plugin-proposal-optional-catch-binding/-/plugin-proposal-optional-catch-binding-7.12.1.tgz	@babel/plugin-proposal-optional-catch-binding
	https://registry.npmjs.org/@babel/types/-/types-7.12.7.tgz	@babel/types
	https://registry.npmjs.org/@babel/eslint-plugin/-/eslint-plugin-7.12.1.tgz	@babel/eslint-plugin
	https://registry.npmjs.org/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.12.1.tgz	@babel/plugin-transform-modules-amd
	https://registry.npmjs.org/@babel/traverse/-/traverse-7.12.9.tgz	@babel/traverse
	https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.10.4.tgz	@babel/helper-validator-identifier
	https://registry.npmjs.org/@babel/helper-wrap-function/-/helper-wrap-function-7.12.3.tgz	@babel/helper-wrap-function
	https://registry.npmjs.org/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.10.4.tgz	@babel/helper-builder-binary-assignment-operator-visitor
	https://registry.npmjs.org/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.12.1.tgz	@babel/plugin-transform-dotall-regex
	https://registry.npmjs.org/@babel/compat-data/-/compat-data-7.12.7.tgz	@babel/compat-data
	https://registry.npmjs.org/@babel/plugin-transform-classes/-/plugin-transform-classes-7.12.1.tgz	@babel/plugin-transform-classes
	https://registry.npmjs.org/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.12.1.tgz	@babel/plugin-transform-parameters
	https://registry.npmjs.org/@babel/plugin-proposal-json-strings/-/plugin-proposal-json-strings-7.12.1.tgz	@babel/plugin-proposal-json-strings
	https://registry.npmjs.org/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz	@babel/plugin-syntax-optional-chaining
	https://registry.npmjs.org/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.12.1.tgz	@babel/helper-remap-async-to-generator
	https://registry.npmjs.org/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.12.1.tgz	@babel/plugin-proposal-private-methods
	https://registry.npmjs.org/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.12.1.tgz	@babel/helper-skip-transparent-expression-wrappers
	https://registry.npmjs.org/@babel/plugin-proposal-nullish-coalescing-operator/-/plugin-proposal-nullish-coalescing-operator-7.12.1.tgz	@babel/plugin-proposal-nullish-coalescing-operator
	https://registry.npmjs.org/@babel/plugin-proposal-logical-assignment-operators/-/plugin-proposal-logical-assignment-operators-7.12.1.tgz	@babel/plugin-proposal-logical-assignment-operators
	https://registry.npmjs.org/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.12.1.tgz	@babel/plugin-transform-typeof-symbol
	https://registry.npmjs.org/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.12.1.tgz	@babel/plugin-transform-exponentiation-operator
	https://registry.npmjs.org/@babel/preset-env/-/preset-env-7.12.7.tgz	@babel/preset-env
	https://registry.npmjs.org/@babel/plugin-transform-spread/-/plugin-transform-spread-7.12.1.tgz	@babel/plugin-transform-spread
	https://registry.npmjs.org/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.12.1.tgz	@babel/plugin-transform-template-literals
	https://registry.npmjs.org/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.12.1.tgz	@babel/plugin-transform-shorthand-properties
	https://registry.npmjs.org/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.12.1.tgz	@babel/plugin-transform-object-super
	https://registry.npmjs.org/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.12.1.tgz	@babel/plugin-proposal-class-properties
	https://registry.npmjs.org/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.10.4.tgz	@babel/helper-annotate-as-pure
	https://registry.npmjs.org/@babel/parser/-/parser-7.12.7.tgz	@babel/parser
	https://registry.npmjs.org/@babel/helper-replace-supers/-/helper-replace-supers-7.12.5.tgz	@babel/helper-replace-supers
	https://registry.npmjs.org/@babel/core/-/core-7.12.9.tgz	@babel/core
	https://registry.npmjs.org/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz	@babel/plugin-syntax-json-strings
	https://registry.npmjs.org/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.11.0.tgz	@babel/helper-split-export-declaration
	https://registry.npmjs.org/@babel/helpers/-/helpers-7.12.5.tgz	@babel/helpers
	https://registry.npmjs.org/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz	@babel/plugin-syntax-numeric-separator
	https://registry.npmjs.org/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz	@babel/plugin-syntax-logical-assignment-operators
	https://registry.npmjs.org/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.12.1.tgz	@babel/plugin-transform-computed-properties
	https://registry.npmjs.org/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.12.1.tgz	@babel/plugin-transform-modules-umd
	https://registry.npmjs.org/@babel/plugin-proposal-unicode-property-regex/-/plugin-proposal-unicode-property-regex-7.12.1.tgz	@babel/plugin-proposal-unicode-property-regex
	https://registry.npmjs.org/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.12.1.tgz	@babel/plugin-proposal-object-rest-spread
	https://registry.npmjs.org/@babel/helper-module-imports/-/helper-module-imports-7.12.5.tgz	@babel/helper-module-imports
	https://registry.npmjs.org/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.12.1.tgz	@babel/plugin-transform-property-literals
	https://registry.npmjs.org/@babel/plugin-proposal-export-namespace-from/-/plugin-proposal-export-namespace-from-7.12.1.tgz	@babel/plugin-proposal-export-namespace-from
	https://registry.npmjs.org/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.12.1.tgz	@babel/plugin-transform-member-expression-literals
	https://registry.npmjs.org/@babel/plugin-proposal-optional-chaining/-/plugin-proposal-optional-chaining-7.12.7.tgz	@babel/plugin-proposal-optional-chaining
	https://registry.npmjs.org/@babel/runtime/-/runtime-7.12.5.tgz	@babel/runtime
	https://registry.npmjs.org/@babel/helper-hoist-variables/-/helper-hoist-variables-7.10.4.tgz	@babel/helper-hoist-variables
	https://registry.npmjs.org/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.12.1.tgz	@babel/plugin-transform-unicode-regex
	https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.10.4.tgz	@babel/helper-plugin-utils
	https://registry.npmjs.org/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.12.7.tgz	@babel/helper-create-regexp-features-plugin
	https://registry.npmjs.org/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.12.1.tgz	@babel/helper-create-class-features-plugin
	https://registry.npmjs.org/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.12.1.tgz	@babel/plugin-transform-async-to-generator
	https://registry.npmjs.org/@babel/preset-modules/-/preset-modules-0.1.4.tgz	@babel/preset-modules
	https://registry.npmjs.org/@babel/plugin-proposal-async-generator-functions/-/plugin-proposal-async-generator-functions-7.12.1.tgz	@babel/plugin-proposal-async-generator-functions
	https://registry.npmjs.org/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.12.1.tgz	@babel/plugin-transform-unicode-escapes
	https://registry.npmjs.org/@babel/plugin-proposal-dynamic-import/-/plugin-proposal-dynamic-import-7.12.1.tgz	@babel/plugin-proposal-dynamic-import
	https://registry.npmjs.org/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.12.7.tgz	@babel/helper-member-expression-to-functions
	https://registry.npmjs.org/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.12.1.tgz	@babel/plugin-transform-destructuring
	https://registry.npmjs.org/@babel/plugin-proposal-numeric-separator/-/plugin-proposal-numeric-separator-7.12.7.tgz	@babel/plugin-proposal-numeric-separator
	https://registry.npmjs.org/@babel/plugin-transform-literals/-/plugin-transform-literals-7.12.1.tgz	@babel/plugin-transform-literals
	https://registry.npmjs.org/@babel/helper-validator-option/-/helper-validator-option-7.12.1.tgz	@babel/helper-validator-option
	https://registry.npmjs.org/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.12.7.tgz	@babel/helper-optimise-call-expression
	https://registry.npmjs.org/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.12.1.tgz	@babel/plugin-transform-regenerator
	https://registry.npmjs.org/@babel/helper-get-function-arity/-/helper-get-function-arity-7.10.4.tgz	@babel/helper-get-function-arity
	https://registry.npmjs.org/@babel/template/-/template-7.12.7.tgz	@babel/template
	https://registry.npmjs.org/@babel/helper-function-name/-/helper-function-name-7.10.4.tgz	@babel/helper-function-name
	https://registry.npmjs.org/@babel/helper-module-transforms/-/helper-module-transforms-7.12.1.tgz	@babel/helper-module-transforms
	https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.10.4.tgz	@babel/code-frame
	https://registry.npmjs.org/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.12.1.tgz	@babel/plugin-transform-modules-systemjs
	https://registry.npmjs.org/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.1.tgz	@babel/plugin-syntax-class-properties
	https://registry.npmjs.org/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.12.1.tgz	@babel/plugin-transform-modules-commonjs
	https://registry.npmjs.org/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz	@babel/plugin-syntax-object-rest-spread
	https://registry.npmjs.org/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.12.1.tgz	@babel/plugin-transform-block-scoped-functions
	https://registry.npmjs.org/@babel/highlight/-/highlight-7.10.4.tgz	@babel/highlight
	https://registry.npmjs.org/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.12.1.tgz	@babel/plugin-transform-reserved-words
	https://registry.npmjs.org/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.12.1.tgz	@babel/plugin-transform-new-target
	https://registry.npmjs.org/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.12.7.tgz	@babel/plugin-transform-sticky-regex
	https://registry.npmjs.org/@babel/helper-compilation-targets/-/helper-compilation-targets-7.12.5.tgz	@babel/helper-compilation-targets
	https://registry.npmjs.org/@babel/helper-explode-assignable-expression/-/helper-explode-assignable-expression-7.12.1.tgz	@babel/helper-explode-assignable-expression
	https://registry.npmjs.org/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz	@babel/plugin-syntax-dynamic-import
	https://registry.npmjs.org/@babel/generator/-/generator-7.12.5.tgz	@babel/generator
	https://registry.npmjs.org/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.12.1.tgz	@babel/plugin-transform-function-name
	https://registry.npmjs.org/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz	@babel/plugin-syntax-async-generators
	https://registry.npmjs.org/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz	@babel/plugin-syntax-nullish-coalescing-operator
	https://registry.npmjs.org/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.12.1.tgz	@babel/plugin-transform-named-capturing-groups-regex
	https://registry.npmjs.org/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.12.1.tgz	@babel/plugin-transform-for-of
	https://registry.npmjs.org/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.12.1.tgz	@babel/plugin-syntax-top-level-await
	https://registry.npmjs.org/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.12.1.tgz	@babel/plugin-transform-block-scoping
	https://registry.npmjs.org/@babel/helper-define-map/-/helper-define-map-7.10.5.tgz	@babel/helper-define-map
	https://registry.npmjs.org/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.12.1.tgz	@babel/plugin-transform-duplicate-keys
	https://registry.npmjs.org/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.12.1.tgz	@babel/plugin-transform-arrow-functions
	https://registry.npmjs.org/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz	@babel/plugin-syntax-export-namespace-from
	https://registry.npmjs.org/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz	json-parse-even-better-errors
	https://registry.npmjs.org/espree/-/espree-7.3.0.tgz	espree
	https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz	shebang-command
	https://registry.npmjs.org/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz	@webassemblyjs/helper-buffer
	https://registry.npmjs.org/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz	@webassemblyjs/ieee754
	https://registry.npmjs.org/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz	@webassemblyjs/helper-fsm
	https://registry.npmjs.org/@webassemblyjs/utf8/-/utf8-1.9.0.tgz	@webassemblyjs/utf8
	https://registry.npmjs.org/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz	@webassemblyjs/wast-parser
	https://registry.npmjs.org/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz	@webassemblyjs/helper-module-context
	https://registry.npmjs.org/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz	@webassemblyjs/wast-printer
	https://registry.npmjs.org/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz	@webassemblyjs/floating-point-hex-parser
	https://registry.npmjs.org/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz	@webassemblyjs/helper-api-error
	https://registry.npmjs.org/@webassemblyjs/leb128/-/leb128-1.9.0.tgz	@webassemblyjs/leb128
	https://registry.npmjs.org/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz	@webassemblyjs/wasm-edit
	https://registry.npmjs.org/@webassemblyjs/ast/-/ast-1.9.0.tgz	@webassemblyjs/ast
	https://registry.npmjs.org/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz	@webassemblyjs/wasm-gen
	https://registry.npmjs.org/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz	@webassemblyjs/helper-code-frame
	https://registry.npmjs.org/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz	@webassemblyjs/wasm-parser
	https://registry.npmjs.org/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz	@webassemblyjs/helper-wasm-bytecode
	https://registry.npmjs.org/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz	@webassemblyjs/helper-wasm-section
	https://registry.npmjs.org/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz	@webassemblyjs/wasm-opt
	https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz	normalize-path
	https://registry.npmjs.org/locate-path/-/locate-path-3.0.0.tgz	find-cache-dir/node_modules/locate-path
	https://registry.npmjs.org/pkg-dir/-/pkg-dir-3.0.0.tgz	find-cache-dir/node_modules/pkg-dir
	https://registry.npmjs.org/find-up/-/find-up-3.0.0.tgz	find-cache-dir/node_modules/find-up
	https://registry.npmjs.org/p-locate/-/p-locate-3.0.0.tgz	find-cache-dir/node_modules/p-locate
	https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz	find-cache-dir/node_modules/p-limit
	https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz	find-cache-dir/node_modules/p-try
	https://registry.npmjs.org/find-cache-dir/-/find-cache-dir-2.1.0.tgz	find-cache-dir
	https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz	path-is-absolute
	https://registry.npmjs.org/progress/-/progress-2.0.3.tgz	progress
	https://registry.npmjs.org/is-string/-/is-string-1.0.5.tgz	is-string
	https://registry.npmjs.org/regenerate-unicode-properties/-/regenerate-unicode-properties-8.2.0.tgz	regenerate-unicode-properties
	https://registry.npmjs.org/regexpu-core/-/regexpu-core-4.7.1.tgz	regexpu-core
	https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.0.tgz	readable-stream
	https://registry.npmjs.org/dot-case/-/dot-case-3.0.3.tgz	dot-case
	https://registry.npmjs.org/normalize-range/-/normalize-range-0.1.2.tgz	normalize-range
	https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.3.tgz	signal-exit
	https://registry.npmjs.org/parse-json/-/parse-json-5.1.0.tgz	parse-json
	https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz	supports-color
	https://registry.npmjs.org/array-back/-/array-back-4.0.1.tgz	array-back
	https://registry.npmjs.org/babel-loader/-/babel-loader-8.2.1.tgz	babel-loader
	https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz	parent-module
	https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz	mkdirp
	https://registry.npmjs.org/braces/-/braces-3.0.2.tgz	braces
	https://registry.npmjs.org/natural-compare/-/natural-compare-1.4.0.tgz	natural-compare
	https://registry.npmjs.org/ignore/-/ignore-4.0.6.tgz	ignore
	https://registry.npmjs.org/no-case/-/no-case-3.0.3.tgz	no-case
	https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz	boolbase
	https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz	resolve-from
	https://registry.npmjs.org/commander/-/commander-2.20.3.tgz	terser-webpack-plugin/node_modules/commander
	https://registry.npmjs.org/source-map/-/source-map-0.7.3.tgz	terser-webpack-plugin/node_modules/terser/node_modules/source-map
	https://registry.npmjs.org/terser/-/terser-5.5.0.tgz	terser-webpack-plugin/node_modules/terser
	https://registry.npmjs.org/p-limit/-/p-limit-3.0.2.tgz	terser-webpack-plugin/node_modules/p-limit
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz	terser-webpack-plugin/node_modules/source-map
	https://registry.npmjs.org/schema-utils/-/schema-utils-3.0.0.tgz	terser-webpack-plugin/node_modules/schema-utils
	https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz	terser-webpack-plugin/node_modules/p-try
	https://registry.npmjs.org/terser-webpack-plugin/-/terser-webpack-plugin-5.0.3.tgz	terser-webpack-plugin
	https://registry.npmjs.org/wordwrapjs/-/wordwrapjs-4.0.0.tgz	wordwrapjs
	https://registry.npmjs.org/css-what/-/css-what-2.1.3.tgz	css-what
	https://registry.npmjs.org/eslint-scope/-/eslint-scope-5.1.0.tgz	eslint-scope
	https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz	util-deprecate
	https://registry.npmjs.org/big.js/-/big.js-5.2.2.tgz	big.js
	https://registry.npmjs.org/pify/-/pify-4.0.1.tgz	pify
	https://registry.npmjs.org/mime-types/-/mime-types-2.1.27.tgz	mime-types
	https://registry.npmjs.org/loader-runner/-/loader-runner-4.1.0.tgz	loader-runner
	https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz	shebang-regex
	https://registry.npmjs.org/semver/-/semver-7.3.2.tgz	eslint-plugin-jsdoc/node_modules/semver
	https://registry.npmjs.org/eslint-plugin-jsdoc/-/eslint-plugin-jsdoc-30.7.8.tgz	eslint-plugin-jsdoc
	https://registry.npmjs.org/rechoir/-/rechoir-0.7.0.tgz	rechoir
	https://registry.npmjs.org/schema-utils/-/schema-utils-2.7.1.tgz	schema-utils
	https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz	escape-string-regexp
	https://registry.npmjs.org/resolve/-/resolve-1.19.0.tgz	resolve
	https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz	isexe
	https://registry.npmjs.org/html-minifier-terser/-/html-minifier-terser-5.1.1.tgz	html-minifier-terser
	https://registry.npmjs.org/postcss-selector-parser/-/postcss-selector-parser-6.0.4.tgz	postcss-selector-parser
	https://registry.npmjs.org/contains-path/-/contains-path-0.1.0.tgz	contains-path
	https://registry.npmjs.org/string.prototype.trimend/-/string.prototype.trimend-1.0.3.tgz	string.prototype.trimend
	https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz	esprima
	https://registry.npmjs.org/he/-/he-1.2.0.tgz	he
	https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz	sprintf-js
	https://registry.npmjs.org/vfile-location/-/vfile-location-3.2.0.tgz	vfile-location
	https://registry.npmjs.org/picomatch/-/picomatch-2.2.2.tgz	picomatch
	https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz	end-of-stream
	https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz	minimatch
	https://registry.npmjs.org/p-try/-/p-try-1.0.0.tgz	p-try
"
npm2x_set_globals

DESCRIPTION="Bot to play youtube/soundcloud/radio/local music on Mumble."
HOMEPAGE="https://github.com/azlux/botamusique"
SRC_URI="https://github.com/azlux/botamusique/archive/${PV}.tar.gz -> ${P}.tar.gz
	${NPM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="${DEPEND}
	acct-user/botamusique
	$(python_gen_impl_dep sqlite)
	$(python_gen_cond_dep '
		dev-python/flask[${PYTHON_USEDEP}]
		net-misc/youtube-dl[${PYTHON_USEDEP}]
		dev-python/python-magic[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		media-libs/mutagen[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pymumble[${PYTHON_USEDEP}]
		dev-python/pyradios[${PYTHON_USEDEP}]
	')"
BDEPEND=""

RESTRICT="mirror"

PATCHES="${FILESDIR}/absolute-db-paths.patch"

src_unpack() {
	npm2x_filter_archives
	default

	cd "${S}"/web
	npm2x_src_unpack_modules
}

src_prepare() {
	default
	python_fix_shebang mumbleBot.py
}

src_compile() {
	cd "${S}"/web
	npm2x_src_compile
	npm run build
}

src_install() {
	dobin "${FILESDIR}/botamusique"

	insinto /etc
	newins configuration.example.ini botamusique.ini

	insinto "/usr/share/${PN}"
	for f in lang static configuration.default.ini; do
		doins -r "${f}"
		dosym "${EPREFIX}/usr/share/${PN}/${f}" "/usr/libexec/${PN}/${f}"
	done

	insinto "/usr/libexec/${PN}/media"
	doins -r media/*.py
	insinto "/usr/libexec/${PN}"
	doins -r *.py
	insopts -m755
	doins mumbleBot.py

	newinitd "${FILESDIR}/botamusique.init" botamusique
	newconfd "${FILESDIR}/botamusique.conf" botamusique

	python_optimize "${ED}/usr/libexec/${PN}"
}
