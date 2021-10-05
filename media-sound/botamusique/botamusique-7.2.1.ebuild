# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit python-single-r1 npm2x

NPM_MODULES="
	lines-and-columns 1.1.6	lines-and-columns
	source-map 0.6.1	postcss/node_modules/source-map
	postcss 8.2.15	postcss
	semver 7.3.2	sass-loader/node_modules/semver
	loader-utils 2.0.0	sass-loader/node_modules/loader-utils
	schema-utils 3.0.0	sass-loader/node_modules/schema-utils
	sass-loader 10.1.0	sass-loader
	locate-path 2.0.0	locate-path
	debug 2.6.9	eslint-import-resolver-node/node_modules/debug
	ms 2.0.0	eslint-import-resolver-node/node_modules/ms
	eslint-import-resolver-node 0.3.4	eslint-import-resolver-node
	esutils 2.0.3	esutils
	is-arrayish 0.2.1	is-arrayish
	chrome-trace-event 1.0.2	chrome-trace-event
	pkg-dir 2.0.0	pkg-dir
	execa 4.1.0	execa
	param-case 3.0.3	param-case
	webpack-merge 4.2.2	webpack-merge
	source-map 0.6.1	clean-css/node_modules/source-map
	clean-css 4.2.3	clean-css
	strip-json-comments 3.1.1	strip-json-comments
	debug 2.6.9	eslint-plugin-import/node_modules/debug
	ms 2.0.0	eslint-plugin-import/node_modules/ms
	doctrine 1.5.0	eslint-plugin-import/node_modules/doctrine
	eslint-plugin-import 2.22.1	eslint-plugin-import
	ajv-keywords 3.5.2	ajv-keywords
	path-parse 1.0.6	path-parse
	lower-case 2.0.1	lower-case
	emojis-list 3.0.0	emojis-list
	strip-ansi 6.0.0	strip-ansi
	ansi-regex 5.0.0	ansi-regex
	string.prototype.trimstart 1.0.3	string.prototype.trimstart
	type-fest 0.8.1	type-fest
	node-releases 1.1.67	node-releases
	fast-json-stable-stringify 2.1.0	fast-json-stable-stringify
	eslint-plugin-jquery 1.5.1	eslint-plugin-jquery
	table 5.4.6	table
	strip-final-newline 2.0.0	strip-final-newline
	has 1.0.3	has
	concat-map 0.0.1	concat-map
	has-flag 4.0.0	jest-worker/node_modules/has-flag
	supports-color 7.2.0	jest-worker/node_modules/supports-color
	jest-worker 26.6.2	jest-worker
	electron-to-chromium 1.3.607	electron-to-chromium
	globals 11.12.0	globals
	estraverse 5.2.0	esquery/node_modules/estraverse
	esquery 1.3.1	esquery
	path-type 4.0.0	path-type
	debug 4.3.1	debug
	colorette 1.2.2	colorette
	icss-utils 5.1.0	icss-utils
	onetime 5.1.2	onetime
	globals 12.4.0	@eslint/eslintrc/node_modules/globals
	@eslint/eslintrc 0.2.1	@eslint/eslintrc
	validate-npm-package-license 3.0.4	validate-npm-package-license
	is-date-object 1.0.2	is-date-object
	tapable 1.1.3	tapable
	wrappy 1.0.2	wrappy
	slice-ansi 2.1.0	slice-ansi
	entities 1.1.2	htmlparser2/node_modules/entities
	htmlparser2 3.10.1	htmlparser2
	astral-regex 1.0.0	astral-regex
	source-map 0.6.1	source-map-support/node_modules/source-map
	source-map-support 0.5.19	source-map-support
	locate-path 5.0.0	webpack/node_modules/locate-path
	pkg-dir 4.2.0	webpack/node_modules/pkg-dir
	tapable 2.1.1	webpack/node_modules/tapable
	webpack-sources 2.2.0	webpack/node_modules/webpack-sources
	find-up 4.1.0	webpack/node_modules/find-up
	acorn 8.0.4	webpack/node_modules/acorn
	p-locate 4.1.0	webpack/node_modules/p-locate
	path-exists 4.0.0	webpack/node_modules/path-exists
	p-limit 2.3.0	webpack/node_modules/p-limit
	source-map 0.6.1	webpack/node_modules/source-map
	eslint-scope 5.1.1	webpack/node_modules/eslint-scope
	schema-utils 3.0.0	webpack/node_modules/schema-utils
	p-try 2.2.0	webpack/node_modules/p-try
	webpack 5.6.0	webpack
	is-negative-zero 2.0.0	is-negative-zero
	acorn-jsx 5.3.1	acorn-jsx
	imurmurhash 0.1.4	imurmurhash
	serialize-javascript 5.0.1	serialize-javascript
	regenerator-runtime 0.13.7	regenerator-runtime
	postcss-modules-values 4.0.0	postcss-modules-values
	object-keys 1.1.1	object-keys
	jsesc 2.5.2	jsesc
	inflight 1.0.6	inflight
	relateurl 0.2.7	relateurl
	estraverse 4.3.0	estraverse
	commander 6.2.0	webpack-cli/node_modules/commander
	webpack-cli 4.2.0	webpack-cli
	browserslist 4.14.7	browserslist
	get-stream 5.2.0	get-stream
	nanoid 3.1.23	nanoid
	npm-run-path 4.0.1	npm-run-path
	source-map 0.6.1	webpack-sources/node_modules/source-map
	webpack-sources 1.4.3	webpack-sources
	eslint-utils 2.1.0	eslint-utils
	bootswatch 4.5.3	bootswatch
	jquery-migrate 3.3.2	jquery-migrate
	functional-red-black-tree 1.0.1	functional-red-black-tree
	jquery 3.5.1	jquery
	type-check 0.4.0	type-check
	spdx-correct 3.1.1	spdx-correct
	estraverse 5.2.0	esrecurse/node_modules/estraverse
	esrecurse 4.3.0	esrecurse
	fill-range 7.0.1	fill-range
	ansi-styles 3.2.1	ansi-styles
	eslint-visitor-keys 1.3.0	eslint-visitor-keys
	regextras 0.7.1	regextras
	find-up 2.1.0	find-up
	ajv 6.12.6	ajv
	domelementtype 1.3.1	domelementtype
	babel-plugin-dynamic-import-node 2.3.3	babel-plugin-dynamic-import-node
	is-callable 1.2.2	is-callable
	acorn 7.4.1	acorn
	is-glob 4.0.1	is-glob
	callsites 3.1.0	callsites
	reduce-flatten 2.0.0	reduce-flatten
	unicode-match-property-ecmascript 1.0.4	unicode-match-property-ecmascript
	postcss-modules-local-by-default 4.0.0	postcss-modules-local-by-default
	typical 5.2.0	typical
	mimic-fn 2.1.0	mimic-fn
	sass 1.29.0	sass
	debug 2.6.9	eslint-module-utils/node_modules/debug
	ms 2.0.0	eslint-module-utils/node_modules/ms
	eslint-module-utils 2.6.0	eslint-module-utils
	merge-stream 2.0.0	merge-stream
	isarray 1.0.0	isarray
	prelude-ls 1.2.1	prelude-ls
	once 1.4.0	once
	ms 2.1.2	ms
	commander 4.1.1	commander
	unicode-property-aliases-ecmascript 1.1.0	unicode-property-aliases-ecmascript
	@xtuc/ieee754 1.2.0	@xtuc/ieee754
	@xtuc/long 4.2.2	@xtuc/long
	postcss-modules-extract-imports 3.0.0	postcss-modules-extract-imports
	commondir 1.0.1	commondir
	semver 5.7.1	semver
	word-wrap 1.2.3	word-wrap
	get-intrinsic 1.0.1	get-intrinsic
	fs.realpath 1.0.0	fs.realpath
	is-binary-path 2.1.0	is-binary-path
	to-regex-range 5.0.1	to-regex-range
	define-properties 1.1.3	define-properties
	levn 0.4.1	levn
	utila 0.4.0	utila
	which 2.0.2	which
	json5 1.0.1	loader-utils/node_modules/json5
	loader-utils 1.4.0	loader-utils
	tslib 1.14.1	tslib
	convert-source-map 1.7.0	convert-source-map
	is-number 7.0.0	is-number
	envinfo 7.7.3	envinfo
	interpret 2.2.0	interpret
	watchpack 2.0.1	watchpack
	is-extglob 2.1.1	is-extglob
	emoji-regex 7.0.3	emoji-regex
	enquirer 2.3.6	enquirer
	is-regex 1.1.1	is-regex
	@types/tapable 1.0.6	@types/tapable
	source-map 0.6.1	@types/webpack/node_modules/source-map
	@types/webpack 4.41.25	@types/webpack
	source-map 0.7.3	@types/webpack-sources/node_modules/source-map
	@types/webpack-sources 2.0.0	@types/webpack-sources
	@types/node 14.14.9	@types/node
	@types/json-schema 7.0.6	@types/json-schema
	@types/estree 0.0.45	@types/estree
	@types/json5 0.0.29	@types/json5
	@types/source-list-map 0.1.2	@types/source-list-map
	@types/eslint 7.2.5	@types/eslint
	@types/anymatch 1.3.1	@types/anymatch
	@types/parse-json 4.0.0	@types/parse-json
	@types/eslint-scope 3.7.0	@types/eslint-scope
	@types/html-minifier-terser 5.1.1	@types/html-minifier-terser
	source-map 0.6.1	@types/uglify-js/node_modules/source-map
	@types/uglify-js 3.11.1	@types/uglify-js
	es-abstract 1.18.0-next.1	es-abstract
	path-key 3.1.1	path-key
	events 3.2.0	events
	object-inspect 1.8.0	object-inspect
	deep-is 0.1.3	deep-is
	camelcase 6.2.0	camelcase
	json5 2.1.3	json5
	popper.js 1.16.1	popper.js
	json-stable-stringify-without-jsonify 1.0.1	json-stable-stringify-without-jsonify
	es-abstract 1.17.7	object.values/node_modules/es-abstract
	object.values 1.1.1	object.values
	normalize-package-data 2.5.0	normalize-package-data
	ansi-colors 4.1.1	ansi-colors
	randombytes 2.1.0	randombytes
	cssesc 3.0.0	cssesc
	readdirp 3.5.0	readdirp
	tapable 2.1.1	enhanced-resolve/node_modules/tapable
	enhanced-resolve 5.3.2	enhanced-resolve
	balanced-match 1.0.0	balanced-match
	source-list-map 2.0.1	source-list-map
	pascal-case 3.1.1	pascal-case
	cosmiconfig 7.0.0	cosmiconfig
	indexes-of 1.0.1	indexes-of
	is-fullwidth-code-point 2.0.0	is-fullwidth-code-point
	p-locate 2.0.0	p-locate
	argparse 1.0.10	argparse
	spdx-license-ids 3.0.6	spdx-license-ids
	locate-path 5.0.0	import-local/node_modules/locate-path
	pkg-dir 4.2.0	import-local/node_modules/pkg-dir
	find-up 4.1.0	import-local/node_modules/find-up
	p-locate 4.1.0	import-local/node_modules/p-locate
	path-exists 4.0.0	import-local/node_modules/path-exists
	p-limit 2.3.0	import-local/node_modules/p-limit
	p-try 2.2.0	import-local/node_modules/p-try
	import-local 3.0.2	import-local
	bootstrap 4.5.3	bootstrap
	uniq 1.0.1	uniq
	file-entry-cache 5.0.1	file-entry-cache
	minimist 1.2.5	minimist
	has-symbols 1.0.1	has-symbols
	js-tokens 4.0.0	js-tokens
	resolve-from 5.0.0	resolve-cwd/node_modules/resolve-from
	resolve-cwd 3.0.0	resolve-cwd
	comment-parser 0.7.6	comment-parser
	camel-case 4.1.1	camel-case
	buffer-from 1.1.1	buffer-from
	lodash 4.17.21	lodash
	table-layout 1.0.1	table-layout
	json-schema-traverse 0.4.1	json-schema-traverse
	es-abstract 1.17.7	object.getownpropertydescriptors/node_modules/es-abstract
	object.getownpropertydescriptors 2.1.0	object.getownpropertydescriptors
	write 1.0.3	write
	postcss-modules-scope 3.0.0	postcss-modules-scope
	js-yaml 3.14.0	js-yaml
	klona 2.0.4	klona
	function-bind 1.1.1	function-bind
	read-pkg-up 2.0.0	read-pkg-up
	strip-ansi 5.2.0	string-width/node_modules/strip-ansi
	ansi-regex 4.1.0	string-width/node_modules/ansi-regex
	string-width 3.1.0	string-width
	optionator 0.9.1	optionator
	leven 3.1.0	leven
	json-parse-better-errors 1.0.2	json-parse-better-errors
	object.assign 4.1.2	object.assign
	regenerate 1.4.2	regenerate
	color-convert 1.9.3	color-convert
	import-fresh 3.2.2	import-fresh
	css-select 1.2.0	css-select
	strip-ansi 3.0.1	renderkid/node_modules/strip-ansi
	ansi-regex 2.1.1	renderkid/node_modules/ansi-regex
	renderkid 2.0.4	renderkid
	path-exists 3.0.0	path-exists
	array-includes 3.1.2	array-includes
	cross-spawn 7.0.3	cross-spawn
	globals 12.4.0	eslint/node_modules/globals
	ansi-styles 4.3.0	eslint/node_modules/ansi-styles
	eslint-visitor-keys 2.0.0	eslint/node_modules/eslint-visitor-keys
	semver 7.3.2	eslint/node_modules/semver
	color-convert 2.0.1	eslint/node_modules/color-convert
	chalk 4.1.0	eslint/node_modules/chalk
	has-flag 4.0.0	eslint/node_modules/has-flag
	color-name 1.1.4	eslint/node_modules/color-name
	supports-color 7.2.0	eslint/node_modules/supports-color
	eslint-scope 5.1.1	eslint/node_modules/eslint-scope
	eslint 7.14.0	eslint
	brace-expansion 1.1.11	brace-expansion
	unicode-match-property-value-ecmascript 1.2.0	unicode-match-property-value-ecmascript
	command-line-usage 6.1.1	command-line-usage
	semver 7.0.0	core-js-compat/node_modules/semver
	core-js-compat 3.7.0	core-js-compat
	punycode 2.1.1	punycode
	nth-check 1.0.2	nth-check
	binary-extensions 2.1.0	binary-extensions
	@webpack-cli/serve 1.1.0	@webpack-cli/serve
	@webpack-cli/info 1.1.0	@webpack-cli/info
	jsdoctypeparser 9.0.0	jsdoctypeparser
	semver 7.3.2	postcss-loader/node_modules/semver
	loader-utils 2.0.0	postcss-loader/node_modules/loader-utils
	schema-utils 3.0.0	postcss-loader/node_modules/schema-utils
	postcss-loader 4.1.0	postcss-loader
	is-core-module 2.1.0	is-core-module
	jsesc 0.5.0	regjsparser/node_modules/jsesc
	regjsparser 0.6.4	regjsparser
	es-to-primitive 1.2.1	es-to-primitive
	safe-buffer 5.2.1	string_decoder/node_modules/safe-buffer
	string_decoder 1.3.0	string_decoder
	pump 3.0.0	pump
	caniuse-lite 1.0.30001161	caniuse-lite
	regenerator-transform 0.14.5	regenerator-transform
	json5 1.0.1	tsconfig-paths/node_modules/json5
	tsconfig-paths 3.9.0	tsconfig-paths
	postcss-value-parser 4.1.0	postcss-value-parser
	eslint-rule-composer 0.3.0	eslint-rule-composer
	html-webpack-plugin 4.5.0	html-webpack-plugin
	regjsgen 0.5.2	regjsgen
	@fortawesome/free-solid-svg-icons 5.15.1	@fortawesome/free-solid-svg-icons
	@fortawesome/fontawesome-svg-core 1.2.32	@fortawesome/fontawesome-svg-core
	@fortawesome/free-regular-svg-icons 5.15.1	@fortawesome/free-regular-svg-icons
	@fortawesome/fontawesome-common-types 0.2.32	@fortawesome/fontawesome-common-types
	escalade 3.1.1	escalade
	regexpp 3.1.0	regexpp
	path-type 2.0.0	read-pkg/node_modules/path-type
	pify 2.3.0	read-pkg/node_modules/pify
	read-pkg 2.0.0	read-pkg
	safe-buffer 5.1.2	safe-buffer
	mime-db 1.44.0	mime-db
	yaml 1.10.0	yaml
	glob-to-regexp 0.4.1	glob-to-regexp
	domhandler 2.4.2	domhandler
	util.promisify 1.0.0	util.promisify
	rimraf 2.6.3	rimraf
	anymatch 3.1.1	anymatch
	domelementtype 2.0.2	dom-serializer/node_modules/domelementtype
	dom-serializer 0.2.2	dom-serializer
	chokidar 3.4.3	chokidar
	glob 7.1.6	glob
	human-signals 1.1.1	human-signals
	entities 2.1.0	entities
	fast-levenshtein 2.0.6	fast-levenshtein
	strip-bom 3.0.0	strip-bom
	uri-js 4.4.0	uri-js
	inherits 2.0.4	inherits
	core-js 3.7.0	core-js
	to-fast-properties 2.0.0	to-fast-properties
	num2fraction 1.2.2	num2fraction
	is-symbol 1.0.3	is-symbol
	dom-converter 0.2.0	dom-converter
	flatted 2.0.2	flatted
	chalk 2.4.2	chalk
	make-dir 2.1.0	make-dir
	parse-json 2.2.0	load-json-file/node_modules/parse-json
	pify 2.3.0	load-json-file/node_modules/pify
	load-json-file 2.0.0	load-json-file
	unicode-canonical-property-names-ecmascript 1.0.4	unicode-canonical-property-names-ecmascript
	pretty-error 2.1.2	pretty-error
	doctrine 3.0.0	doctrine
	error-ex 1.3.2	error-ex
	call-bind 1.0.0	call-bind
	commander 2.20.3	terser/node_modules/commander
	source-map 0.6.1	terser/node_modules/source-map
	terser 4.8.0	terser
	array.prototype.flat 1.2.4	array.prototype.flat
	hosted-git-info 2.8.9	hosted-git-info
	semver 7.3.2	css-loader/node_modules/semver
	loader-utils 2.0.0	css-loader/node_modules/loader-utils
	schema-utils 3.0.0	css-loader/node_modules/schema-utils
	css-loader 5.0.1	css-loader
	spdx-exceptions 2.3.0	spdx-exceptions
	domutils 1.5.1	domutils
	p-limit 1.3.0	p-limit
	fast-deep-equal 3.1.3	fast-deep-equal
	graceful-fs 4.2.4	graceful-fs
	loader-utils 2.0.0	mini-css-extract-plugin/node_modules/loader-utils
	schema-utils 3.0.0	mini-css-extract-plugin/node_modules/schema-utils
	mini-css-extract-plugin 1.3.1	mini-css-extract-plugin
	glob-parent 5.1.1	glob-parent
	has-flag 3.0.0	has-flag
	color-name 1.1.3	color-name
	is-stream 2.0.0	is-stream
	v8-compile-cache 2.2.0	v8-compile-cache
	neo-async 2.6.2	neo-async
	source-map 0.5.7	source-map
	gensync 1.0.0-beta.2	gensync
	flat-cache 2.0.1	flat-cache
	autoprefixer 10.0.2	autoprefixer
	text-table 0.2.0	text-table
	spdx-expression-parse 3.0.1	spdx-expression-parse
	deep-extend 0.6.0	deep-extend
	semver 6.3.0	@babel/eslint-parser/node_modules/semver
	@babel/eslint-parser 7.12.1	@babel/eslint-parser
	@babel/helper-simple-access 7.12.1	@babel/helper-simple-access
	@babel/plugin-syntax-optional-catch-binding 7.8.3	@babel/plugin-syntax-optional-catch-binding
	@babel/plugin-proposal-optional-catch-binding 7.12.1	@babel/plugin-proposal-optional-catch-binding
	@babel/types 7.12.7	@babel/types
	@babel/eslint-plugin 7.12.1	@babel/eslint-plugin
	@babel/plugin-transform-modules-amd 7.12.1	@babel/plugin-transform-modules-amd
	@babel/traverse 7.12.9	@babel/traverse
	@babel/helper-validator-identifier 7.10.4	@babel/helper-validator-identifier
	@babel/helper-wrap-function 7.12.3	@babel/helper-wrap-function
	@babel/helper-builder-binary-assignment-operator-visitor 7.10.4	@babel/helper-builder-binary-assignment-operator-visitor
	@babel/plugin-transform-dotall-regex 7.12.1	@babel/plugin-transform-dotall-regex
	@babel/compat-data 7.12.7	@babel/compat-data
	@babel/plugin-transform-classes 7.12.1	@babel/plugin-transform-classes
	@babel/plugin-transform-parameters 7.12.1	@babel/plugin-transform-parameters
	@babel/plugin-proposal-json-strings 7.12.1	@babel/plugin-proposal-json-strings
	@babel/plugin-syntax-optional-chaining 7.8.3	@babel/plugin-syntax-optional-chaining
	@babel/helper-remap-async-to-generator 7.12.1	@babel/helper-remap-async-to-generator
	@babel/plugin-proposal-private-methods 7.12.1	@babel/plugin-proposal-private-methods
	@babel/helper-skip-transparent-expression-wrappers 7.12.1	@babel/helper-skip-transparent-expression-wrappers
	@babel/plugin-proposal-nullish-coalescing-operator 7.12.1	@babel/plugin-proposal-nullish-coalescing-operator
	@babel/plugin-proposal-logical-assignment-operators 7.12.1	@babel/plugin-proposal-logical-assignment-operators
	@babel/plugin-transform-typeof-symbol 7.12.1	@babel/plugin-transform-typeof-symbol
	@babel/plugin-transform-exponentiation-operator 7.12.1	@babel/plugin-transform-exponentiation-operator
	@babel/preset-env 7.12.7	@babel/preset-env
	@babel/plugin-transform-spread 7.12.1	@babel/plugin-transform-spread
	@babel/plugin-transform-template-literals 7.12.1	@babel/plugin-transform-template-literals
	@babel/plugin-transform-shorthand-properties 7.12.1	@babel/plugin-transform-shorthand-properties
	@babel/plugin-transform-object-super 7.12.1	@babel/plugin-transform-object-super
	@babel/plugin-proposal-class-properties 7.12.1	@babel/plugin-proposal-class-properties
	@babel/helper-annotate-as-pure 7.10.4	@babel/helper-annotate-as-pure
	@babel/parser 7.12.7	@babel/parser
	@babel/helper-replace-supers 7.12.5	@babel/helper-replace-supers
	@babel/core 7.12.9	@babel/core
	@babel/plugin-syntax-json-strings 7.8.3	@babel/plugin-syntax-json-strings
	@babel/helper-split-export-declaration 7.11.0	@babel/helper-split-export-declaration
	@babel/helpers 7.12.5	@babel/helpers
	@babel/plugin-syntax-numeric-separator 7.10.4	@babel/plugin-syntax-numeric-separator
	@babel/plugin-syntax-logical-assignment-operators 7.10.4	@babel/plugin-syntax-logical-assignment-operators
	@babel/plugin-transform-computed-properties 7.12.1	@babel/plugin-transform-computed-properties
	@babel/plugin-transform-modules-umd 7.12.1	@babel/plugin-transform-modules-umd
	@babel/plugin-proposal-unicode-property-regex 7.12.1	@babel/plugin-proposal-unicode-property-regex
	@babel/plugin-proposal-object-rest-spread 7.12.1	@babel/plugin-proposal-object-rest-spread
	@babel/helper-module-imports 7.12.5	@babel/helper-module-imports
	@babel/plugin-transform-property-literals 7.12.1	@babel/plugin-transform-property-literals
	@babel/plugin-proposal-export-namespace-from 7.12.1	@babel/plugin-proposal-export-namespace-from
	@babel/plugin-transform-member-expression-literals 7.12.1	@babel/plugin-transform-member-expression-literals
	@babel/plugin-proposal-optional-chaining 7.12.7	@babel/plugin-proposal-optional-chaining
	@babel/runtime 7.12.5	@babel/runtime
	@babel/helper-hoist-variables 7.10.4	@babel/helper-hoist-variables
	@babel/plugin-transform-unicode-regex 7.12.1	@babel/plugin-transform-unicode-regex
	@babel/helper-plugin-utils 7.10.4	@babel/helper-plugin-utils
	@babel/helper-create-regexp-features-plugin 7.12.7	@babel/helper-create-regexp-features-plugin
	@babel/helper-create-class-features-plugin 7.12.1	@babel/helper-create-class-features-plugin
	@babel/plugin-transform-async-to-generator 7.12.1	@babel/plugin-transform-async-to-generator
	@babel/preset-modules 0.1.4	@babel/preset-modules
	@babel/plugin-proposal-async-generator-functions 7.12.1	@babel/plugin-proposal-async-generator-functions
	@babel/plugin-transform-unicode-escapes 7.12.1	@babel/plugin-transform-unicode-escapes
	@babel/plugin-proposal-dynamic-import 7.12.1	@babel/plugin-proposal-dynamic-import
	@babel/helper-member-expression-to-functions 7.12.7	@babel/helper-member-expression-to-functions
	@babel/plugin-transform-destructuring 7.12.1	@babel/plugin-transform-destructuring
	@babel/plugin-proposal-numeric-separator 7.12.7	@babel/plugin-proposal-numeric-separator
	@babel/plugin-transform-literals 7.12.1	@babel/plugin-transform-literals
	@babel/helper-validator-option 7.12.1	@babel/helper-validator-option
	@babel/helper-optimise-call-expression 7.12.7	@babel/helper-optimise-call-expression
	@babel/plugin-transform-regenerator 7.12.1	@babel/plugin-transform-regenerator
	@babel/helper-get-function-arity 7.10.4	@babel/helper-get-function-arity
	@babel/template 7.12.7	@babel/template
	@babel/helper-function-name 7.10.4	@babel/helper-function-name
	@babel/helper-module-transforms 7.12.1	@babel/helper-module-transforms
	@babel/code-frame 7.10.4	@babel/code-frame
	@babel/plugin-transform-modules-systemjs 7.12.1	@babel/plugin-transform-modules-systemjs
	@babel/plugin-syntax-class-properties 7.12.1	@babel/plugin-syntax-class-properties
	@babel/plugin-transform-modules-commonjs 7.12.1	@babel/plugin-transform-modules-commonjs
	@babel/plugin-syntax-object-rest-spread 7.8.3	@babel/plugin-syntax-object-rest-spread
	@babel/plugin-transform-block-scoped-functions 7.12.1	@babel/plugin-transform-block-scoped-functions
	@babel/highlight 7.10.4	@babel/highlight
	@babel/plugin-transform-reserved-words 7.12.1	@babel/plugin-transform-reserved-words
	@babel/plugin-transform-new-target 7.12.1	@babel/plugin-transform-new-target
	@babel/plugin-transform-sticky-regex 7.12.7	@babel/plugin-transform-sticky-regex
	@babel/helper-compilation-targets 7.12.5	@babel/helper-compilation-targets
	@babel/helper-explode-assignable-expression 7.12.1	@babel/helper-explode-assignable-expression
	@babel/plugin-syntax-dynamic-import 7.8.3	@babel/plugin-syntax-dynamic-import
	@babel/generator 7.12.5	@babel/generator
	@babel/plugin-transform-function-name 7.12.1	@babel/plugin-transform-function-name
	@babel/plugin-syntax-async-generators 7.8.4	@babel/plugin-syntax-async-generators
	@babel/plugin-syntax-nullish-coalescing-operator 7.8.3	@babel/plugin-syntax-nullish-coalescing-operator
	@babel/plugin-transform-named-capturing-groups-regex 7.12.1	@babel/plugin-transform-named-capturing-groups-regex
	@babel/plugin-transform-for-of 7.12.1	@babel/plugin-transform-for-of
	@babel/plugin-syntax-top-level-await 7.12.1	@babel/plugin-syntax-top-level-await
	@babel/plugin-transform-block-scoping 7.12.1	@babel/plugin-transform-block-scoping
	@babel/helper-define-map 7.10.5	@babel/helper-define-map
	@babel/plugin-transform-duplicate-keys 7.12.1	@babel/plugin-transform-duplicate-keys
	@babel/plugin-transform-arrow-functions 7.12.1	@babel/plugin-transform-arrow-functions
	@babel/plugin-syntax-export-namespace-from 7.8.3	@babel/plugin-syntax-export-namespace-from
	json-parse-even-better-errors 2.3.1	json-parse-even-better-errors
	espree 7.3.0	espree
	shebang-command 2.0.0	shebang-command
	@webassemblyjs/helper-buffer 1.9.0	@webassemblyjs/helper-buffer
	@webassemblyjs/ieee754 1.9.0	@webassemblyjs/ieee754
	@webassemblyjs/helper-fsm 1.9.0	@webassemblyjs/helper-fsm
	@webassemblyjs/utf8 1.9.0	@webassemblyjs/utf8
	@webassemblyjs/wast-parser 1.9.0	@webassemblyjs/wast-parser
	@webassemblyjs/helper-module-context 1.9.0	@webassemblyjs/helper-module-context
	@webassemblyjs/wast-printer 1.9.0	@webassemblyjs/wast-printer
	@webassemblyjs/floating-point-hex-parser 1.9.0	@webassemblyjs/floating-point-hex-parser
	@webassemblyjs/helper-api-error 1.9.0	@webassemblyjs/helper-api-error
	@webassemblyjs/leb128 1.9.0	@webassemblyjs/leb128
	@webassemblyjs/wasm-edit 1.9.0	@webassemblyjs/wasm-edit
	@webassemblyjs/ast 1.9.0	@webassemblyjs/ast
	@webassemblyjs/wasm-gen 1.9.0	@webassemblyjs/wasm-gen
	@webassemblyjs/helper-code-frame 1.9.0	@webassemblyjs/helper-code-frame
	@webassemblyjs/wasm-parser 1.9.0	@webassemblyjs/wasm-parser
	@webassemblyjs/helper-wasm-bytecode 1.9.0	@webassemblyjs/helper-wasm-bytecode
	@webassemblyjs/helper-wasm-section 1.9.0	@webassemblyjs/helper-wasm-section
	@webassemblyjs/wasm-opt 1.9.0	@webassemblyjs/wasm-opt
	normalize-path 3.0.0	normalize-path
	locate-path 3.0.0	find-cache-dir/node_modules/locate-path
	pkg-dir 3.0.0	find-cache-dir/node_modules/pkg-dir
	find-up 3.0.0	find-cache-dir/node_modules/find-up
	p-locate 3.0.0	find-cache-dir/node_modules/p-locate
	p-limit 2.3.0	find-cache-dir/node_modules/p-limit
	p-try 2.2.0	find-cache-dir/node_modules/p-try
	find-cache-dir 2.1.0	find-cache-dir
	path-is-absolute 1.0.1	path-is-absolute
	progress 2.0.3	progress
	is-string 1.0.5	is-string
	regenerate-unicode-properties 8.2.0	regenerate-unicode-properties
	regexpu-core 4.7.1	regexpu-core
	readable-stream 3.6.0	readable-stream
	dot-case 3.0.3	dot-case
	normalize-range 0.1.2	normalize-range
	signal-exit 3.0.3	signal-exit
	parse-json 5.1.0	parse-json
	supports-color 5.5.0	supports-color
	array-back 4.0.1	array-back
	babel-loader 8.2.1	babel-loader
	parent-module 1.0.1	parent-module
	mkdirp 0.5.5	mkdirp
	braces 3.0.2	braces
	natural-compare 1.4.0	natural-compare
	ignore 4.0.6	ignore
	no-case 3.0.3	no-case
	boolbase 1.0.0	boolbase
	resolve-from 4.0.0	resolve-from
	commander 2.20.3	terser-webpack-plugin/node_modules/commander
	source-map 0.7.3	terser-webpack-plugin/node_modules/terser/node_modules/source-map
	terser 5.5.0	terser-webpack-plugin/node_modules/terser
	p-limit 3.0.2	terser-webpack-plugin/node_modules/p-limit
	source-map 0.6.1	terser-webpack-plugin/node_modules/source-map
	schema-utils 3.0.0	terser-webpack-plugin/node_modules/schema-utils
	p-try 2.2.0	terser-webpack-plugin/node_modules/p-try
	terser-webpack-plugin 5.0.3	terser-webpack-plugin
	wordwrapjs 4.0.0	wordwrapjs
	css-what 2.1.3	css-what
	eslint-scope 5.1.0	eslint-scope
	util-deprecate 1.0.2	util-deprecate
	big.js 5.2.2	big.js
	pify 4.0.1	pify
	mime-types 2.1.27	mime-types
	loader-runner 4.1.0	loader-runner
	shebang-regex 3.0.0	shebang-regex
	semver 7.3.2	eslint-plugin-jsdoc/node_modules/semver
	eslint-plugin-jsdoc 30.7.8	eslint-plugin-jsdoc
	rechoir 0.7.0	rechoir
	schema-utils 2.7.1	schema-utils
	escape-string-regexp 1.0.5	escape-string-regexp
	resolve 1.19.0	resolve
	isexe 2.0.0	isexe
	html-minifier-terser 5.1.1	html-minifier-terser
	postcss-selector-parser 6.0.4	postcss-selector-parser
	contains-path 0.1.0	contains-path
	string.prototype.trimend 1.0.3	string.prototype.trimend
	esprima 4.0.1	esprima
	he 1.2.0	he
	sprintf-js 1.0.3	sprintf-js
	picomatch 2.2.2	picomatch
	end-of-stream 1.4.4	end-of-stream
	minimatch 3.0.4	minimatch
	p-try 1.0.0	p-try
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
	npm run build || die 'npm run build failed'
	cd "${S}"
	${EPYTHON} scripts/translate_templates.py --lang-dir lang/ --template-dir templates/
}

src_install() {
	dobin "${FILESDIR}/botamusique"

	insinto /etc
	newins configuration.example.ini botamusique.ini

	insinto "/usr/share/${PN}"
	for f in lang static templates configuration.default.ini; do
		doins -r "${f}"
		dosym -r "/usr/share/${PN}/${f}" "/usr/libexec/${PN}/${f}"
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
