# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit npm2x

NPM_MODULES="
	https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.8.3.tgz	@babel/code-frame
	https://registry.npmjs.org/@babel/highlight/-/highlight-7.8.3.tgz	@babel/highlight
	https://registry.npmjs.org/@babel/runtime/-/runtime-7.8.7.tgz	@babel/runtime
	https://registry.npmjs.org/@types/color-name/-/color-name-1.1.1.tgz	@types/color-name
	https://registry.npmjs.org/@types/parse-json/-/parse-json-4.0.0.tgz	@types/parse-json
	https://registry.npmjs.org/JSONStream/-/JSONStream-1.3.2.tgz	JSONStream
	https://registry.npmjs.org/accepts/-/accepts-1.3.5.tgz	accepts
	https://registry.npmjs.org/after/-/after-0.8.2.tgz	after
	https://registry.npmjs.org/ajv/-/ajv-5.5.2.tgz	ajv
	https://registry.npmjs.org/ansi-escape-sequences/-/ansi-escape-sequences-5.1.2.tgz	ansi-escape-sequences
	https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-3.0.0.tgz	ansi-escapes
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-2.1.1.tgz	wrap-ansi/node_modules/ansi-regex
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-3.0.0.tgz	ansi-regex
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.0.tgz	ansi-styles
	https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.2.1.tgz	husky/node_modules/ansi-styles
	https://registry.npmjs.org/anymatch/-/anymatch-3.1.1.tgz	anymatch
	https://registry.npmjs.org/argparse/-/argparse-1.0.9.tgz	argparse
	https://registry.npmjs.org/array-back/-/array-back-4.0.1.tgz	array-back
	https://registry.npmjs.org/array-uniq/-/array-uniq-1.0.2.tgz	array-uniq
	https://registry.npmjs.org/arraybuffer.slice/-/arraybuffer.slice-0.0.7.tgz	arraybuffer.slice
	https://registry.npmjs.org/asn1/-/asn1-0.1.11.tgz	restify/node_modules/asn1
	https://registry.npmjs.org/asn1/-/asn1-0.2.3.tgz	asn1
	https://registry.npmjs.org/assert-plus/-/assert-plus-0.1.5.tgz	restify/node_modules/assert-plus
	https://registry.npmjs.org/assert-plus/-/assert-plus-1.0.0.tgz	assert-plus
	https://registry.npmjs.org/async-limiter/-/async-limiter-1.0.0.tgz	async-limiter
	https://registry.npmjs.org/async/-/async-2.4.0.tgz	getos/node_modules/async
	https://registry.npmjs.org/async/-/async-2.6.1.tgz	async
	https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz	asynckit
	https://registry.npmjs.org/aws-sign2/-/aws-sign2-0.7.0.tgz	aws-sign2
	https://registry.npmjs.org/aws4/-/aws4-1.7.0.tgz	aws4
	https://registry.npmjs.org/backo2/-/backo2-1.0.2.tgz	backo2
	https://registry.npmjs.org/backoff/-/backoff-2.5.0.tgz	backoff
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz	balanced-match
	https://registry.npmjs.org/base64-arraybuffer/-/base64-arraybuffer-0.1.5.tgz	base64-arraybuffer
	https://registry.npmjs.org/base64id/-/base64id-1.0.0.tgz	base64id
	https://registry.npmjs.org/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.1.tgz	bcrypt-pbkdf
	https://registry.npmjs.org/better-assert/-/better-assert-1.0.2.tgz	better-assert
	https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.0.0.tgz	binary-extensions
	https://registry.npmjs.org/bl/-/bl-1.2.2.tgz	bl
	https://registry.npmjs.org/blob/-/blob-0.0.4.tgz	blob
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.8.tgz	brace-expansion
	https://registry.npmjs.org/braces/-/braces-3.0.2.tgz	braces
	https://registry.npmjs.org/buffer-alloc-unsafe/-/buffer-alloc-unsafe-1.1.0.tgz	buffer-alloc-unsafe
	https://registry.npmjs.org/buffer-alloc/-/buffer-alloc-1.2.0.tgz	buffer-alloc
	https://registry.npmjs.org/buffer-fill/-/buffer-fill-1.0.0.tgz	buffer-fill
	https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.1.tgz	buffer-from
	https://registry.npmjs.org/bunyan/-/bunyan-1.8.12.tgz	bunyan
	https://registry.npmjs.org/callsite/-/callsite-1.0.0.tgz	callsite
	https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz	parent-module/node_modules/callsites
	https://registry.npmjs.org/camelcase/-/camelcase-4.1.0.tgz	camelcase
	https://registry.npmjs.org/carrier/-/carrier-0.3.0.tgz	carrier
	https://registry.npmjs.org/caseless/-/caseless-0.12.0.tgz	caseless
	https://registry.npmjs.org/chalk/-/chalk-2.3.1.tgz	chalk
	https://registry.npmjs.org/chalk/-/chalk-3.0.0.tgz	husky/node_modules/chalk
	https://registry.npmjs.org/chardet/-/chardet-0.4.2.tgz	chardet
	https://registry.npmjs.org/chokidar/-/chokidar-3.3.1.tgz	chokidar
	https://registry.npmjs.org/chownr/-/chownr-1.1.4.tgz	chownr
	https://registry.npmjs.org/ci-info/-/ci-info-2.0.0.tgz	ci-info
	https://registry.npmjs.org/cli-cursor/-/cli-cursor-2.1.0.tgz	cli-cursor
	https://registry.npmjs.org/cli-width/-/cli-width-2.2.0.tgz	cli-width
	https://registry.npmjs.org/cliui/-/cliui-4.1.0.tgz	cliui
	https://registry.npmjs.org/co/-/co-4.6.0.tgz	co
	https://registry.npmjs.org/code-point-at/-/code-point-at-1.1.0.tgz	code-point-at
	https://registry.npmjs.org/color-convert/-/color-convert-1.9.1.tgz	color-convert
	https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz	husky/node_modules/color-convert
	https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz	color-name
	https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz	husky/node_modules/color-name
	https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.6.tgz	combined-stream
	https://registry.npmjs.org/compare-versions/-/compare-versions-3.2.1.tgz	compare-versions
	https://registry.npmjs.org/compare-versions/-/compare-versions-3.6.0.tgz	husky/node_modules/compare-versions
	https://registry.npmjs.org/component-bind/-/component-bind-1.0.0.tgz	component-bind
	https://registry.npmjs.org/component-emitter/-/component-emitter-1.2.1.tgz	component-emitter
	https://registry.npmjs.org/component-inherit/-/component-inherit-0.0.3.tgz	component-inherit
	https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz	concat-map
	https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz	concat-stream
	https://registry.npmjs.org/cookie/-/cookie-0.3.1.tgz	cookie
	https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz	core-util-is
	https://registry.npmjs.org/cosmiconfig/-/cosmiconfig-6.0.0.tgz	cosmiconfig
	https://registry.npmjs.org/create-output-stream/-/create-output-stream-0.0.1.tgz	create-output-stream
	https://registry.npmjs.org/cross-spawn/-/cross-spawn-5.1.0.tgz	cross-spawn
	https://registry.npmjs.org/csv-generate/-/csv-generate-0.0.6.tgz	csv-generate
	https://registry.npmjs.org/csv-parse/-/csv-parse-1.3.3.tgz	csv-parse
	https://registry.npmjs.org/csv-stringify/-/csv-stringify-0.0.8.tgz	csv-stringify
	https://registry.npmjs.org/csv/-/csv-0.4.6.tgz	csv
	https://registry.npmjs.org/ctype/-/ctype-0.5.3.tgz	ctype
	https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz	dashdash
	https://registry.npmjs.org/debug/-/debug-2.6.8.tgz	debug
	https://registry.npmjs.org/debug/-/debug-3.1.0.tgz	engine.io-client/node_modules/debug
	https://registry.npmjs.org/debug/-/debug-3.1.0.tgz	engine.io/node_modules/debug
	https://registry.npmjs.org/debug/-/debug-3.1.0.tgz	socket.io-client/node_modules/debug
	https://registry.npmjs.org/debug/-/debug-3.1.0.tgz	socket.io-parser/node_modules/debug
	https://registry.npmjs.org/debug/-/debug-3.1.0.tgz	socket.io/node_modules/debug
	https://registry.npmjs.org/debug/-/debug-3.2.6.tgz	docker-modem/node_modules/debug
	https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz	decamelize
	https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz	delayed-stream
	https://registry.npmjs.org/detect-node/-/detect-node-2.0.3.tgz	detect-node
	https://registry.npmjs.org/docker-modem/-/docker-modem-1.0.9.tgz	docker-modem
	https://registry.npmjs.org/dockerode/-/dockerode-2.5.8.tgz	dockerode
	https://registry.npmjs.org/dtrace-provider/-/dtrace-provider-0.8.3.tgz	dtrace-provider
	https://registry.npmjs.org/ecc-jsbn/-/ecc-jsbn-0.1.1.tgz	ecc-jsbn
	https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz	end-of-stream
	https://registry.npmjs.org/engine.io-client/-/engine.io-client-3.2.1.tgz	engine.io-client
	https://registry.npmjs.org/engine.io-parser/-/engine.io-parser-2.1.2.tgz	engine.io-parser
	https://registry.npmjs.org/engine.io/-/engine.io-3.2.0.tgz	engine.io
	https://registry.npmjs.org/error-ex/-/error-ex-1.3.1.tgz	error-ex
	https://registry.npmjs.org/escape-regexp-component/-/escape-regexp-component-1.0.2.tgz	escape-regexp-component
	https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz	escape-string-regexp
	https://registry.npmjs.org/esprima/-/esprima-4.0.0.tgz	node-yaml/node_modules/esprima
	https://registry.npmjs.org/esutils/-/esutils-2.0.2.tgz	esutils
	https://registry.npmjs.org/execa/-/execa-0.7.0.tgz	execa
	https://registry.npmjs.org/extend/-/extend-3.0.1.tgz	extend
	https://registry.npmjs.org/extendify/-/extendify-1.0.0.tgz	extendify
	https://registry.npmjs.org/external-editor/-/external-editor-2.1.0.tgz	external-editor
	https://registry.npmjs.org/extsprintf/-/extsprintf-1.2.0.tgz	vasync/node_modules/extsprintf
	https://registry.npmjs.org/extsprintf/-/extsprintf-1.3.0.tgz	extsprintf
	https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-1.0.0.tgz	fast-deep-equal
	https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz	fast-json-stable-stringify
	https://registry.npmjs.org/figures/-/figures-2.0.0.tgz	figures
	https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz	fill-range
	https://registry.npmjs.org/find-up/-/find-up-2.1.0.tgz	find-up
	https://registry.npmjs.org/find-up/-/find-up-4.1.0.tgz	husky/node_modules/find-up
	https://registry.npmjs.org/find-versions/-/find-versions-3.2.0.tgz	find-versions
	https://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz	forever-agent
	https://registry.npmjs.org/form-data/-/form-data-2.3.2.tgz	form-data
	https://registry.npmjs.org/formidable/-/formidable-1.2.1.tgz	formidable
	https://registry.npmjs.org/fs-constants/-/fs-constants-1.0.0.tgz	fs-constants
	https://registry.npmjs.org/fs-extra/-/fs-extra-8.1.0.tgz	fs-extra
	https://registry.npmjs.org/get-caller-file/-/get-caller-file-1.0.2.tgz	get-caller-file
	https://registry.npmjs.org/get-stream/-/get-stream-3.0.0.tgz	get-stream
	https://registry.npmjs.org/getos/-/getos-3.1.0.tgz	getos
	https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz	getpass
	https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.0.tgz	glob-parent
	https://registry.npmjs.org/glob/-/glob-6.0.4.tgz	glob
	https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.1.11.tgz	graceful-fs
	https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.3.tgz	fs-extra/node_modules/graceful-fs
	https://registry.npmjs.org/handle-thing/-/handle-thing-1.2.5.tgz	handle-thing
	https://registry.npmjs.org/har-schema/-/har-schema-2.0.0.tgz	har-schema
	https://registry.npmjs.org/har-validator/-/har-validator-5.0.3.tgz	har-validator
	https://registry.npmjs.org/has-binary2/-/has-binary2-1.0.3.tgz	has-binary2
	https://registry.npmjs.org/has-cors/-/has-cors-1.1.0.tgz	has-cors
	https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz	has-flag
	https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz	husky/node_modules/has-flag
	https://registry.npmjs.org/hpack.js/-/hpack.js-2.1.6.tgz	hpack.js
	https://registry.npmjs.org/http-deceiver/-/http-deceiver-1.2.7.tgz	http-deceiver
	https://registry.npmjs.org/http-signature/-/http-signature-0.11.0.tgz	restify/node_modules/http-signature
	https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz	request/node_modules/http-signature
	https://registry.npmjs.org/husky/-/husky-4.2.3.tgz	husky
	https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.19.tgz	iconv-lite
	https://registry.npmjs.org/import-fresh/-/import-fresh-3.2.1.tgz	import-fresh
	https://registry.npmjs.org/indexof/-/indexof-0.0.1.tgz	indexof
	https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz	inflight
	https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz	inherits
	https://registry.npmjs.org/ini/-/ini-1.3.5.tgz	ini
	https://registry.npmjs.org/inquirer/-/inquirer-5.2.0.tgz	inquirer
	https://registry.npmjs.org/invert-kv/-/invert-kv-1.0.0.tgz	invert-kv
	https://registry.npmjs.org/ip-address/-/ip-address-5.9.4.tgz	ip-address
	https://registry.npmjs.org/ip-cidr/-/ip-cidr-2.0.7.tgz	ip-cidr
	https://registry.npmjs.org/is-arrayish/-/is-arrayish-0.2.1.tgz	is-arrayish
	https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz	is-binary-path
	https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz	is-extglob
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz	wrap-ansi/node_modules/is-fullwidth-code-point
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz	is-fullwidth-code-point
	https://registry.npmjs.org/is-glob/-/is-glob-4.0.1.tgz	is-glob
	https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz	is-number
	https://registry.npmjs.org/is-promise/-/is-promise-2.1.0.tgz	is-promise
	https://registry.npmjs.org/is-stream/-/is-stream-1.1.0.tgz	is-stream
	https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz	is-typedarray
	https://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz	docker-modem/node_modules/isarray
	https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz	isarray
	https://registry.npmjs.org/isarray/-/isarray-2.0.1.tgz	has-binary2/node_modules/isarray
	https://registry.npmjs.org/isarray/-/isarray-2.0.1.tgz	socket.io-parser/node_modules/isarray
	https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz	isexe
	https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz	isstream
	https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz	@babel/highlight/node_modules/js-tokens
	https://registry.npmjs.org/js-yaml/-/js-yaml-3.9.1.tgz	node-yaml/node_modules/js-yaml
	https://registry.npmjs.org/jsbn/-/jsbn-0.1.1.tgz	jsbn
	https://registry.npmjs.org/jsbn/-/jsbn-1.1.0.tgz	ip-address/node_modules/jsbn
	https://registry.npmjs.org/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz	json-parse-better-errors
	https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.3.1.tgz	json-schema-traverse
	https://registry.npmjs.org/json-schema/-/json-schema-0.2.3.tgz	json-schema
	https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz	json-stringify-safe
	https://registry.npmjs.org/jsonfile/-/jsonfile-4.0.0.tgz	jsonfile
	https://registry.npmjs.org/jsonparse/-/jsonparse-1.3.1.tgz	jsonparse
	https://registry.npmjs.org/jsprim/-/jsprim-1.4.1.tgz	jsprim
	https://registry.npmjs.org/junk/-/junk-2.1.0.tgz	junk
	https://registry.npmjs.org/keep-alive-agent/-/keep-alive-agent-0.0.1.tgz	keep-alive-agent
	https://registry.npmjs.org/keypair/-/keypair-1.0.1.tgz	keypair
	https://registry.npmjs.org/klaw/-/klaw-2.1.1.tgz	klaw
	https://registry.npmjs.org/lcid/-/lcid-1.0.0.tgz	lcid
	https://registry.npmjs.org/lines-and-columns/-/lines-and-columns-1.1.6.tgz	lines-and-columns
	https://registry.npmjs.org/locate-path/-/locate-path-2.0.0.tgz	locate-path
	https://registry.npmjs.org/locate-path/-/locate-path-5.0.0.tgz	husky/node_modules/locate-path
	https://registry.npmjs.org/lodash/-/lodash-2.4.2.tgz	extendify/node_modules/lodash
	https://registry.npmjs.org/lodash/-/lodash-4.17.15.tgz	lodash
	https://registry.npmjs.org/lru-cache/-/lru-cache-4.1.1.tgz	lru-cache
	https://registry.npmjs.org/mem/-/mem-1.1.0.tgz	mem
	https://registry.npmjs.org/memory-cache/-/memory-cache-0.2.0.tgz	memory-cache
	https://registry.npmjs.org/mime-db/-/mime-db-1.33.0.tgz	mime-db
	https://registry.npmjs.org/mime-types/-/mime-types-2.1.18.tgz	mime-types
	https://registry.npmjs.org/mime/-/mime-1.6.0.tgz	restify/node_modules/mime
	https://registry.npmjs.org/mime/-/mime-2.4.4.tgz	mime
	https://registry.npmjs.org/mimic-fn/-/mimic-fn-1.2.0.tgz	mimic-fn
	https://registry.npmjs.org/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz	minimalistic-assert
	https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz	minimatch
	https://registry.npmjs.org/minimist/-/minimist-0.0.8.tgz	minimist
	https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.1.tgz	mkdirp
	https://registry.npmjs.org/mmmagic/-/mmmagic-0.5.3.tgz	mmmagic
	https://registry.npmjs.org/moment/-/moment-2.24.0.tgz	moment
	https://registry.npmjs.org/ms/-/ms-2.0.0.tgz	ms
	https://registry.npmjs.org/ms/-/ms-2.1.2.tgz	docker-modem/node_modules/ms
	https://registry.npmjs.org/mute-stream/-/mute-stream-0.0.7.tgz	mute-stream
	https://registry.npmjs.org/mv/-/mv-2.1.1.tgz	mv
	https://registry.npmjs.org/nan/-/nan-2.14.0.tgz	mmmagic/node_modules/nan
	https://registry.npmjs.org/nan/-/nan-2.6.2.tgz	nan
	https://registry.npmjs.org/ncp/-/ncp-2.0.0.tgz	ncp
	https://registry.npmjs.org/negotiator/-/negotiator-0.6.1.tgz	negotiator
	https://registry.npmjs.org/node-yaml/-/node-yaml-3.1.1.tgz	node-yaml
	https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz	normalize-path
	https://registry.npmjs.org/npm-run-path/-/npm-run-path-2.0.2.tgz	npm-run-path
	https://registry.npmjs.org/number-is-nan/-/number-is-nan-1.0.1.tgz	number-is-nan
	https://registry.npmjs.org/oauth-sign/-/oauth-sign-0.8.2.tgz	oauth-sign
	https://registry.npmjs.org/object-component/-/object-component-0.0.3.tgz	object-component
	https://registry.npmjs.org/obuf/-/obuf-1.1.2.tgz	obuf
	https://registry.npmjs.org/once/-/once-1.4.0.tgz	once
	https://registry.npmjs.org/onetime/-/onetime-2.0.1.tgz	onetime
	https://registry.npmjs.org/opencollective-postinstall/-/opencollective-postinstall-2.0.2.tgz	opencollective-postinstall
	https://registry.npmjs.org/os-locale/-/os-locale-2.1.0.tgz	os-locale
	https://registry.npmjs.org/os-tmpdir/-/os-tmpdir-1.0.2.tgz	os-tmpdir
	https://registry.npmjs.org/p-finally/-/p-finally-1.0.0.tgz	p-finally
	https://registry.npmjs.org/p-limit/-/p-limit-1.2.0.tgz	p-limit
	https://registry.npmjs.org/p-limit/-/p-limit-2.2.2.tgz	husky/node_modules/p-limit
	https://registry.npmjs.org/p-locate/-/p-locate-2.0.0.tgz	p-locate
	https://registry.npmjs.org/p-locate/-/p-locate-4.1.0.tgz	husky/node_modules/p-locate
	https://registry.npmjs.org/p-try/-/p-try-1.0.0.tgz	p-try
	https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz	husky/node_modules/p-try
	https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz	parent-module
	https://registry.npmjs.org/parse-json/-/parse-json-5.0.0.tgz	cosmiconfig/node_modules/parse-json
	https://registry.npmjs.org/parseqs/-/parseqs-0.0.5.tgz	parseqs
	https://registry.npmjs.org/parseuri/-/parseuri-0.0.5.tgz	parseuri
	https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz	path-exists
	https://registry.npmjs.org/path-exists/-/path-exists-4.0.0.tgz	husky/node_modules/path-exists
	https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz	path-is-absolute
	https://registry.npmjs.org/path-key/-/path-key-2.0.1.tgz	path-key
	https://registry.npmjs.org/path-type/-/path-type-4.0.0.tgz	cosmiconfig/node_modules/path-type
	https://registry.npmjs.org/performance-now/-/performance-now-2.1.0.tgz	performance-now
	https://registry.npmjs.org/picomatch/-/picomatch-2.2.1.tgz	picomatch
	https://registry.npmjs.org/pify/-/pify-2.3.0.tgz	pify
	https://registry.npmjs.org/pinkie-promise/-/pinkie-promise-2.0.1.tgz	pinkie-promise
	https://registry.npmjs.org/pinkie/-/pinkie-2.0.4.tgz	pinkie
	https://registry.npmjs.org/pkg-dir/-/pkg-dir-4.2.0.tgz	husky/node_modules/pkg-dir
	https://registry.npmjs.org/please-upgrade-node/-/please-upgrade-node-3.2.0.tgz	please-upgrade-node
	https://registry.npmjs.org/precond/-/precond-0.2.3.tgz	precond
	https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-1.0.7.tgz	process-nextick-args
	https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz	bl/node_modules/process-nextick-args
	https://registry.npmjs.org/promise-fs/-/promise-fs-1.2.3.tgz	promise-fs
	https://registry.npmjs.org/properties-parser/-/properties-parser-0.3.1.tgz	properties-parser
	https://registry.npmjs.org/pseudomap/-/pseudomap-1.0.2.tgz	pseudomap
	https://registry.npmjs.org/pump/-/pump-1.0.3.tgz	pump
	https://registry.npmjs.org/punycode/-/punycode-1.4.1.tgz	punycode
	https://registry.npmjs.org/qs/-/qs-6.5.2.tgz	qs
	https://registry.npmjs.org/randomstring/-/randomstring-1.1.5.tgz	randomstring
	https://registry.npmjs.org/readable-stream/-/readable-stream-1.0.34.tgz	docker-modem/node_modules/readable-stream
	https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.2.tgz	readable-stream
	https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz	bl/node_modules/readable-stream
	https://registry.npmjs.org/readdirp/-/readdirp-3.3.0.tgz	readdirp
	https://registry.npmjs.org/regenerator-runtime/-/regenerator-runtime-0.13.5.tgz	regenerator-runtime
	https://registry.npmjs.org/request/-/request-2.87.0.tgz	request
	https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz	require-directory
	https://registry.npmjs.org/require-main-filename/-/require-main-filename-1.0.1.tgz	require-main-filename
	https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz	import-fresh/node_modules/resolve-from
	https://registry.npmjs.org/restify/-/restify-4.3.4.tgz	restify
	https://registry.npmjs.org/restore-cursor/-/restore-cursor-2.0.0.tgz	restore-cursor
	https://registry.npmjs.org/rfr/-/rfr-1.2.3.tgz	rfr
	https://registry.npmjs.org/rimraf/-/rimraf-2.4.5.tgz	rimraf
	https://registry.npmjs.org/run-async/-/run-async-2.3.0.tgz	run-async
	https://registry.npmjs.org/rxjs/-/rxjs-5.5.10.tgz	rxjs
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.1.tgz	safe-buffer
	https://registry.npmjs.org/safe-json-stringify/-/safe-json-stringify-1.0.4.tgz	safe-json-stringify
	https://registry.npmjs.org/sax/-/sax-1.2.4.tgz	sax
	https://registry.npmjs.org/select-hose/-/select-hose-2.0.0.tgz	select-hose
	https://registry.npmjs.org/semver-compare/-/semver-compare-1.0.0.tgz	semver-compare
	https://registry.npmjs.org/semver-regex/-/semver-regex-2.0.0.tgz	semver-regex
	https://registry.npmjs.org/semver/-/semver-4.3.6.tgz	semver
	https://registry.npmjs.org/semver/-/semver-5.7.1.tgz	ssh2-streams/node_modules/semver
	https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz	set-blocking
	https://registry.npmjs.org/shebang-command/-/shebang-command-1.2.0.tgz	shebang-command
	https://registry.npmjs.org/shebang-regex/-/shebang-regex-1.0.0.tgz	shebang-regex
	https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.2.tgz	signal-exit
	https://registry.npmjs.org/slash/-/slash-3.0.0.tgz	slash
	https://registry.npmjs.org/socket.io-adapter/-/socket.io-adapter-1.1.1.tgz	socket.io-adapter
	https://registry.npmjs.org/socket.io-client/-/socket.io-client-2.1.1.tgz	socket.io-client
	https://registry.npmjs.org/socket.io-parser/-/socket.io-parser-3.2.0.tgz	socket.io-parser
	https://registry.npmjs.org/socket.io/-/socket.io-2.1.1.tgz	socket.io
	https://registry.npmjs.org/socketio-file-upload/-/socketio-file-upload-0.6.0.tgz	socketio-file-upload
	https://registry.npmjs.org/spdy-transport/-/spdy-transport-2.1.0.tgz	spdy-transport
	https://registry.npmjs.org/spdy/-/spdy-3.4.7.tgz	spdy
	https://registry.npmjs.org/split-ca/-/split-ca-1.0.1.tgz	split-ca
	https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz	argparse/node_modules/sprintf-js
	https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.1.2.tgz	sprintf-js
	https://registry.npmjs.org/ssh2-streams/-/ssh2-streams-0.2.1.tgz	ssh2-streams
	https://registry.npmjs.org/ssh2/-/ssh2-0.6.2.tgz	ssh2
	https://registry.npmjs.org/sshpk/-/sshpk-1.14.1.tgz	sshpk
	https://registry.npmjs.org/stream-transform/-/stream-transform-0.1.2.tgz	stream-transform
	https://registry.npmjs.org/streamsearch/-/streamsearch-0.1.2.tgz	streamsearch
	https://registry.npmjs.org/string-width/-/string-width-1.0.2.tgz	wrap-ansi/node_modules/string-width
	https://registry.npmjs.org/string-width/-/string-width-2.1.1.tgz	string-width
	https://registry.npmjs.org/string.prototype.codepointat/-/string.prototype.codepointat-0.2.0.tgz	string.prototype.codepointat
	https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz	docker-modem/node_modules/string_decoder
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.0.3.tgz	string_decoder
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz	bl/node_modules/string_decoder
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-3.0.1.tgz	wrap-ansi/node_modules/strip-ansi
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-4.0.0.tgz	strip-ansi
	https://registry.npmjs.org/strip-eof/-/strip-eof-1.0.0.tgz	strip-eof
	https://registry.npmjs.org/supports-color/-/supports-color-5.2.0.tgz	supports-color
	https://registry.npmjs.org/supports-color/-/supports-color-7.1.0.tgz	husky/node_modules/supports-color
	https://registry.npmjs.org/symbol-observable/-/symbol-observable-1.0.1.tgz	symbol-observable
	https://registry.npmjs.org/tail/-/tail-1.3.0.tgz	tail
	https://registry.npmjs.org/tar-fs/-/tar-fs-1.16.3.tgz	tar-fs
	https://registry.npmjs.org/tar-stream/-/tar-stream-1.6.2.tgz	tar-stream
	https://registry.npmjs.org/through/-/through-2.3.8.tgz	through
	https://registry.npmjs.org/tmp/-/tmp-0.0.33.tgz	tmp
	https://registry.npmjs.org/to-array/-/to-array-0.1.4.tgz	to-array
	https://registry.npmjs.org/to-buffer/-/to-buffer-1.1.1.tgz	to-buffer
	https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz	to-regex-range
	https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.3.4.tgz	tough-cookie
	https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz	tunnel-agent
	https://registry.npmjs.org/tweetnacl/-/tweetnacl-0.14.5.tgz	tweetnacl
	https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz	typedarray
	https://registry.npmjs.org/ultron/-/ultron-1.1.1.tgz	ultron
	https://registry.npmjs.org/universalify/-/universalify-0.1.2.tgz	universalify
	https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz	util-deprecate
	https://registry.npmjs.org/uuid/-/uuid-3.2.1.tgz	uuid
	https://registry.npmjs.org/vasync/-/vasync-1.6.3.tgz	vasync
	https://registry.npmjs.org/verror/-/verror-1.10.0.tgz	verror
	https://registry.npmjs.org/verror/-/verror-1.6.0.tgz	vasync/node_modules/verror
	https://registry.npmjs.org/wbuf/-/wbuf-1.7.3.tgz	wbuf
	https://registry.npmjs.org/which-module/-/which-module-2.0.0.tgz	which-module
	https://registry.npmjs.org/which-pm-runs/-/which-pm-runs-1.0.0.tgz	which-pm-runs
	https://registry.npmjs.org/which/-/which-1.3.0.tgz	which
	https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-2.1.0.tgz	wrap-ansi
	https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz	wrappy
	https://registry.npmjs.org/ws/-/ws-3.3.3.tgz	ws
	https://registry.npmjs.org/xml2js/-/xml2js-0.4.19.tgz	xml2js
	https://registry.npmjs.org/xmlbuilder/-/xmlbuilder-9.0.7.tgz	xmlbuilder
	https://registry.npmjs.org/xmlhttprequest-ssl/-/xmlhttprequest-ssl-1.5.5.tgz	xmlhttprequest-ssl
	https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz	xtend
	https://registry.npmjs.org/y18n/-/y18n-3.2.1.tgz	y18n
	https://registry.npmjs.org/yallist/-/yallist-2.1.2.tgz	yallist
	https://registry.npmjs.org/yaml/-/yaml-1.8.2.tgz	yaml
	https://registry.npmjs.org/yargs-parser/-/yargs-parser-8.1.0.tgz	yargs-parser
	https://registry.npmjs.org/yargs/-/yargs-10.1.2.tgz	yargs
	https://registry.npmjs.org/yeast/-/yeast-0.1.2.tgz	yeast
"
npm2x_set_globals

DESCRIPTION="Server control and management daemon for Pterodactyl Panel"
HOMEPAGE="https://pterodactyl.io/"
SRC_URI="
	https://github.com/pterodactyl/daemon/releases/download/v${PV}/daemon.tar.gz
	${NPM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	acct-user/pterodactyl
	net-libs/nodejs[npm]
	app-emulation/docker"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/daemon-${PV}"

src_prepare() {
	default

	# This is going to be a symlink later
	rm -r "${S}/src/services/configs/"

	# Fix node-gyp trying to download shit
	cd "${S}/node_modules"
	find -name package.json -exec sed -i 's,node-gyp rebuild,node-gyp rebuild --nodedir /usr,' {} \;
}

src_install() {
	keepdir /var/lib/pterodactyl-daemon/packs
	keepdir /var/lib/pterodactyl-daemon/config
	keepdir /var/lib/pterodactyl-daemon/services
	keepdir /var/log/pterodactyl-daemon

	insinto /usr/lib/pterodactyl-daemon
	cp -r node_modules "${D}/usr/lib/pterodactyl-daemon"
	find "${D}/usr/lib/pterodactyl-daemon" -type d -exec chmod +755 {} \;
	find "${D}/usr/lib/pterodactyl-daemon" -type f -exec chmod +644 {} \;
	doins -r src
	doins -r scripts
	doins package.json
	doins package-lock.json
	dosym "${EPREFIX}/var/lib/pterodactyl-daemon/config" /usr/lib/pterodactyl-daemon/config
	dosym "${EPREFIX}/var/lib/pterodactyl-daemon/packs" /usr/lib/pterodactyl-daemon/packs
	dosym "${EPREFIX}/var/log/pterodactyl-daemon" /usr/lib/pterodactyl-daemon/logs
	dosym "${EPREFIX}/var/lib/pterodactyl-daemon/config" /etc/pterodactyl-daemon
	dosym "${EPREFIX}/var/lib/pterodactyl-daemon/services" /usr/lib/pterodactyl-daemon/src/services/configs

	doinitd "${FILESDIR}/pterodactyl-daemon"

	fowners -R pterodactyl:pterodactyl /var/lib/pterodactyl-daemon /var/log/pterodactyl-daemon
}
