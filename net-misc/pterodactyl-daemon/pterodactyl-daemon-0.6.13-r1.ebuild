# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit npm2x

NPM_MODULES="
	lines-and-columns 1.1.6	lines-and-columns
	eslint-plugin-jsx-a11y 6.0.3	eslint-plugin-jsx-a11y
	is-typedarray 1.0.0	is-typedarray
	external-editor 2.1.0	external-editor
	locate-path 2.0.0	locate-path
	debug 2.6.9	eslint-import-resolver-node/node_modules/debug
	eslint-import-resolver-node 0.3.2	eslint-import-resolver-node
	esutils 2.0.2	esutils
	is-arrayish 0.2.1	is-arrayish
	wordwrap 1.0.0	wordwrap
	find-up 1.1.2	pkg-dir/node_modules/find-up
	path-exists 2.1.0	pkg-dir/node_modules/path-exists
	pkg-dir 1.0.0	pkg-dir
	execa 0.7.0	execa
	is-path-inside 1.0.1	is-path-inside
	strip-ansi 3.0.1	babel-code-frame/node_modules/strip-ansi
	ansi-regex 2.1.1	babel-code-frame/node_modules/ansi-regex
	ansi-styles 2.2.1	babel-code-frame/node_modules/ansi-styles
	chalk 1.1.3	babel-code-frame/node_modules/chalk
	supports-color 2.0.0	babel-code-frame/node_modules/supports-color
	babel-code-frame 6.26.0	babel-code-frame
	ecc-jsbn 0.1.1	ecc-jsbn
	object-component 0.0.3	object-component
	fbjs 0.8.16	fbjs
	strip-json-comments 2.0.1	strip-json-comments
	doctrine 1.5.0	eslint-plugin-import/node_modules/doctrine
	eslint-plugin-import 2.8.0	eslint-plugin-import
	ajv-keywords 2.1.1	ajv-keywords
	path-parse 1.0.5	path-parse
	har-validator 5.0.3	har-validator
	locate-path 5.0.0	husky/node_modules/locate-path
	pkg-dir 4.2.0	husky/node_modules/pkg-dir
	ansi-styles 4.2.1	husky/node_modules/ansi-styles
	find-up 4.1.0	husky/node_modules/find-up
	compare-versions 3.6.0	husky/node_modules/compare-versions
	p-locate 4.1.0	husky/node_modules/p-locate
	color-convert 2.0.1	husky/node_modules/color-convert
	path-exists 4.0.0	husky/node_modules/path-exists
	chalk 3.0.0	husky/node_modules/chalk
	p-limit 2.2.2	husky/node_modules/p-limit
	has-flag 4.0.0	husky/node_modules/has-flag
	color-name 1.1.4	husky/node_modules/color-name
	supports-color 7.1.0	husky/node_modules/supports-color
	p-try 2.2.0	husky/node_modules/p-try
	husky 4.2.3	husky
	strip-ansi 4.0.0	strip-ansi
	ansi-regex 3.0.0	ansi-regex
	invert-kv 1.0.0	invert-kv
	fast-json-stable-stringify 2.0.0	fast-json-stable-stringify
	ci-info 2.0.0	ci-info
	ast-types-flow 0.0.7	ast-types-flow
	table 4.0.2	table
	set-blocking 2.0.0	set-blocking
	safe-json-stringify 1.0.4	safe-json-stringify
	wbuf 1.7.3	wbuf
	properties-parser 0.3.1	properties-parser
	has 1.0.1	has
	concat-map 0.0.1	concat-map
	xml2js 0.4.19	xml2js
	caseless 0.12.0	caseless
	setimmediate 1.0.5	setimmediate
	select-hose 2.0.0	select-hose
	buffer-fill 1.0.0	buffer-fill
	minimalistic-assert 1.0.1	minimalistic-assert
	performance-now 2.1.0	performance-now
	globals 11.3.0	globals
	esquery 1.0.0	esquery
	path-type 2.0.0	path-type
	debug 2.6.8	debug
	tunnel-agent 0.6.0	tunnel-agent
	onetime 2.0.1	onetime
	bunyan 1.8.12	bunyan
	validate-npm-package-license 3.0.1	validate-npm-package-license
	is-date-object 1.0.1	is-date-object
	escape-regexp-component 1.0.2	escape-regexp-component
	eslint-plugin-react 7.5.1	eslint-plugin-react
	wrappy 1.0.2	wrappy
	slice-ansi 1.0.0	slice-ansi
	tmp 0.0.33	tmp
	base64-arraybuffer 0.1.5	base64-arraybuffer
	number-is-nan 1.0.1	number-is-nan
	ansi-escapes 3.0.0	ansi-escapes
	acorn 3.3.0	acorn-jsx/node_modules/acorn
	acorn-jsx 3.0.1	acorn-jsx
	imurmurhash 0.1.4	imurmurhash
	eslint-config-airbnb 16.1.0	eslint-config-airbnb
	regenerator-runtime 0.13.5	regenerator-runtime
	component-inherit 0.0.3	component-inherit
	jsprim 1.4.1	jsprim
	object-keys 1.0.11	object-keys
	xmlbuilder 9.0.7	xmlbuilder
	har-schema 2.0.0	har-schema
	inflight 1.0.6	inflight
	parseuri 0.0.5	parseuri
	yargs-parser 8.1.0	yargs-parser
	estraverse 4.2.0	estraverse
	JSONStream 1.3.2	JSONStream
	find-versions 3.2.0	find-versions
	get-stream 3.0.0	get-stream
	npm-run-path 2.0.2	npm-run-path
	lodash.cond 4.5.2	lodash.cond
	promise-fs 1.2.3	promise-fs
	cli-width 2.2.0	cli-width
	ctype 0.5.3	ctype
	negotiator 0.6.1	negotiator
	form-data 2.3.2	form-data
	combined-stream 1.0.6	combined-stream
	memory-cache 0.2.0	memory-cache
	functional-red-black-tree 1.0.1	functional-red-black-tree
	async 2.6.1	async
	lru-cache 4.1.1	lru-cache
	type-check 0.3.2	type-check
	concat-stream 1.6.2	concat-stream
	spdx-correct 1.0.2	spdx-correct
	esrecurse 4.2.0	esrecurse
	fill-range 7.0.1	fill-range
	debug 3.1.0	socket.io/node_modules/debug
	socket.io 2.1.1	socket.io
	ansi-styles 3.2.0	ansi-styles
	eslint-visitor-keys 1.0.0	eslint-visitor-keys
	xtend 4.0.2	xtend
	aws4 1.7.0	aws4
	find-up 2.1.0	find-up
	inquirer 5.2.0	inquirer
	ajv 5.5.2	ajv
	debug 3.1.0	socket.io-parser/node_modules/debug
	isarray 2.0.1	socket.io-parser/node_modules/isarray
	socket.io-parser 3.2.0	socket.io-parser
	to-buffer 1.1.1	to-buffer
	is-path-cwd 1.0.0	is-path-cwd
	os-locale 2.1.0	os-locale
	json-schema 0.2.3	json-schema
	pinkie 2.0.4	pinkie
	ncp 2.0.0	ncp
	is-callable 1.1.3	is-callable
	acorn 5.4.1	acorn
	extsprintf 1.3.0	extsprintf
	is-glob 4.0.1	is-glob
	callsites 0.2.0	callsites
	axobject-query 0.1.0	axobject-query
	universalify 0.1.2	universalify
	ini 1.3.5	ini
	circular-json 0.3.3	circular-json
	mimic-fn 1.2.0	mimic-fn
	eslint-module-utils 2.1.1	eslint-module-utils
	isarray 1.0.0	isarray
	graceful-fs 4.2.3	fs-extra/node_modules/graceful-fs
	fs-extra 8.1.0	fs-extra
	yeast 0.1.2	yeast
	prelude-ls 1.1.2	prelude-ls
	handle-thing 1.2.5	handle-thing
	glob 7.1.2	globby/node_modules/glob
	globby 5.0.0	globby
	require-directory 2.1.1	require-directory
	once 1.4.0	once
	ms 2.0.0	ms
	restore-cursor 2.0.0	restore-cursor
	commander 2.14.1	commander
	semver-regex 2.0.0	semver-regex
	compare-versions 3.2.1	compare-versions
	stream-transform 0.1.2	stream-transform
	through 2.3.8	through
	precond 0.2.3	precond
	oauth-sign 0.8.2	oauth-sign
	nan 2.6.2	nan
	cli-cursor 2.1.0	cli-cursor
	builtin-modules 1.1.1	builtin-modules
	http-deceiver 1.2.7	http-deceiver
	semver 4.3.6	semver
	mute-stream 0.0.7	mute-stream
	fs.realpath 1.0.0	fs.realpath
	is-binary-path 2.1.0	is-binary-path
	xmlhttprequest-ssl 1.5.5	xmlhttprequest-ssl
	arraybuffer.slice 0.0.7	arraybuffer.slice
	to-regex-range 5.0.1	to-regex-range
	has-cors 1.1.0	has-cors
	define-properties 1.1.2	define-properties
	levn 0.3.0	levn
	ssh2 0.6.2	ssh2
	run-async 2.3.0	run-async
	which 1.3.0	which
	iconv-lite 0.4.19	iconv-lite
	ws 3.3.3	ws
	verror 1.10.0	verror
	ultron 1.1.1	ultron
	aria-query 0.7.1	aria-query
	is-number 7.0.0	is-number
	after 0.8.2	after
	is-extglob 2.1.1	is-extglob
	figures 2.0.0	figures
	emoji-regex 6.5.1	emoji-regex
	is-regex 1.0.4	is-regex
	hpack.js 2.1.6	hpack.js
	@types/color-name 1.1.1	@types/color-name
	@types/parse-json 4.0.0	@types/parse-json
	es-abstract 1.10.0	es-abstract
	path-key 2.0.1	path-key
	delayed-stream 1.0.0	delayed-stream
	http-signature 1.2.0	request/node_modules/http-signature
	request 2.87.0	request
	deep-is 0.1.3	deep-is
	camelcase 4.1.0	camelcase
	parseqs 0.0.5	parseqs
	decamelize 1.2.0	decamelize
	debug 3.1.0	socket.io-client/node_modules/debug
	socket.io-client 2.1.1	socket.io-client
	obuf 1.1.2	obuf
	rfr 1.2.3	rfr
	junk 2.1.0	junk
	json-stable-stringify-without-jsonify 1.0.1	json-stable-stringify-without-jsonify
	qs 6.5.2	qs
	normalize-package-data 2.4.0	normalize-package-data
	yallist 2.1.2	yallist
	node-fetch 1.7.3	node-fetch
	backoff 2.5.0	backoff
	readdirp 3.3.0	readdirp
	balanced-match 1.0.0	balanced-match
	path-type 4.0.0	cosmiconfig/node_modules/path-type
	parse-json 5.0.0	cosmiconfig/node_modules/parse-json
	cosmiconfig 6.0.0	cosmiconfig
	engine.io-parser 2.1.2	engine.io-parser
	is-fullwidth-code-point 2.0.0	is-fullwidth-code-point
	dtrace-provider 0.8.3	dtrace-provider
	component-bind 1.0.0	component-bind
	p-locate 2.0.0	p-locate
	process-nextick-args 1.0.7	process-nextick-args
	jsbn 1.1.0	ip-address/node_modules/jsbn
	ip-address 5.9.4	ip-address
	sprintf-js 1.0.3	argparse/node_modules/sprintf-js
	argparse 1.0.9	argparse
	require-uncached 1.0.3	require-uncached
	spdx-license-ids 1.2.2	spdx-license-ids
	streamsearch 0.1.2	streamsearch
	rx-lite-aggregates 4.0.8	rx-lite-aggregates
	file-entry-cache 2.0.0	file-entry-cache
	minimist 0.0.8	minimist
	semver 5.7.1	ssh2-streams/node_modules/semver
	ssh2-streams 0.2.1	ssh2-streams
	js-tokens 3.0.2	js-tokens
	randomstring 1.1.5	randomstring
	mime 2.4.4	mime
	moment 2.24.0	moment
	code-point-at 1.1.0	code-point-at
	debug 3.2.6	docker-modem/node_modules/debug
	isarray 0.0.1	docker-modem/node_modules/isarray
	ms 2.1.2	docker-modem/node_modules/ms
	string_decoder 0.10.31	docker-modem/node_modules/string_decoder
	readable-stream 1.0.34	docker-modem/node_modules/readable-stream
	docker-modem 1.0.9	docker-modem
	buffer-from 1.1.1	buffer-from
	lodash 4.17.15	lodash
	spdy-transport 2.1.0	spdy-transport
	is-path-in-cwd 1.0.0	is-path-in-cwd
	is-builtin-module 1.0.0	is-builtin-module
	json-schema-traverse 0.3.1	json-schema-traverse
	lodash 2.4.2	extendify/node_modules/lodash
	extendify 1.0.0	extendify
	write 0.2.1	write
	dockerode 2.5.8	dockerode
	socketio-file-upload 0.6.0	socketio-file-upload
	function-bind 1.1.1	function-bind
	read-pkg-up 2.0.0	read-pkg-up
	jsx-ast-utils 2.0.1	jsx-ast-utils
	tail 1.3.0	tail
	base64id 1.0.0	base64id
	string-width 2.1.1	string-width
	keypair 1.0.1	keypair
	optionator 0.8.2	optionator
	symbol-observable 1.0.1	symbol-observable
	is-resolvable 1.1.0	is-resolvable
	jsonfile 4.0.0	jsonfile
	json-parse-better-errors 1.0.2	json-parse-better-errors
	color-convert 1.9.1	color-convert
	resolve-from 4.0.0	import-fresh/node_modules/resolve-from
	import-fresh 3.2.1	import-fresh
	path-is-inside 1.0.2	path-is-inside
	path-exists 3.0.0	path-exists
	semver-compare 1.0.0	semver-compare
	formidable 1.2.1	formidable
	aws-sign2 0.7.0	aws-sign2
	array-includes 3.0.3	array-includes
	array-uniq 1.0.2	array-uniq
	eslint-restricted-globals 0.1.1	eslint-restricted-globals
	cross-spawn 5.1.0	cross-spawn
	extend 3.0.1	extend
	debug 3.1.0	eslint/node_modules/debug
	concat-stream 1.6.0	eslint/node_modules/concat-stream
	inquirer 3.3.0	eslint/node_modules/inquirer
	semver 5.5.0	eslint/node_modules/semver
	js-yaml 3.10.0	eslint/node_modules/js-yaml
	glob 7.1.2	eslint/node_modules/glob
	esprima 4.0.0	eslint/node_modules/esprima
	eslint 4.16.0	eslint
	brace-expansion 1.1.8	brace-expansion
	callsite 1.0.0	callsite
	socket.io-adapter 1.1.1	socket.io-adapter
	punycode 1.4.1	punycode
	csv-generate 0.0.6	csv-generate
	binary-extensions 2.0.0	binary-extensions
	blob 0.0.4	blob
	yargs 10.1.2	yargs
	assert-plus 1.0.0	assert-plus
	core-util-is 1.0.2	core-util-is
	eslint-plugin-lodash 2.5.0	eslint-plugin-lodash
	rx-lite 4.0.8	rx-lite
	which-pm-runs 1.0.0	which-pm-runs
	backo2 1.0.2	backo2
	es-to-primitive 1.1.1	es-to-primitive
	process-nextick-args 2.0.1	bl/node_modules/process-nextick-args
	string_decoder 1.1.1	bl/node_modules/string_decoder
	readable-stream 2.3.7	bl/node_modules/readable-stream
	bl 1.2.2	bl
	string_decoder 1.0.3	string_decoder
	pump 1.0.3	pump
	cliui 4.1.0	cliui
	accepts 1.3.5	accepts
	indexof 0.0.1	indexof
	rxjs 5.5.10	rxjs
	klaw 2.1.1	klaw
	fs-constants 1.0.0	fs-constants
	getpass 0.1.7	getpass
	opencollective-postinstall 2.0.2	opencollective-postinstall
	prop-types 15.6.0	prop-types
	isarray 2.0.1	has-binary2/node_modules/isarray
	has-binary2 1.0.3	has-binary2
	co 4.6.0	co
	which-module 2.0.0	which-module
	extsprintf 1.2.0	vasync/node_modules/extsprintf
	verror 1.6.0	vasync/node_modules/verror
	vasync 1.6.3	vasync
	read-pkg 2.0.0	read-pkg
	safe-buffer 5.1.1	safe-buffer
	isomorphic-fetch 2.2.1	isomorphic-fetch
	debug 3.1.0	engine.io-client/node_modules/debug
	engine.io-client 3.2.1	engine.io-client
	y18n 3.2.1	y18n
	mime-db 1.33.0	mime-db
	yaml 1.8.2	yaml
	tweetnacl 0.14.5	tweetnacl
	rimraf 2.4.5	rimraf
	anymatch 3.1.1	anymatch
	carrier 0.3.0	carrier
	chokidar 3.3.1	chokidar
	glob 6.0.4	glob
	isstream 0.1.2	isstream
	fast-levenshtein 2.0.6	fast-levenshtein
	strip-bom 3.0.0	strip-bom
	buffer-alloc-unsafe 1.1.0	buffer-alloc-unsafe
	inherits 2.0.3	inherits
	sshpk 1.14.1	sshpk
	jsonparse 1.3.1	jsonparse
	p-finally 1.0.0	p-finally
	core-js 1.2.7	core-js
	encoding 0.1.12	encoding
	array-union 1.0.2	array-union
	is-symbol 1.0.1	is-symbol
	chalk 2.3.1	chalk
	csv 0.4.6	csv
	load-json-file 2.0.0	load-json-file
	doctrine 2.1.0	doctrine
	error-ex 1.3.1	error-ex
	hosted-git-info 2.5.0	hosted-git-info
	cookie 0.3.1	cookie
	detect-node 2.0.3	detect-node
	http-signature 0.11.0	restify/node_modules/http-signature
	mime 1.6.0	restify/node_modules/mime
	assert-plus 0.1.5	restify/node_modules/assert-plus
	asn1 0.1.11	restify/node_modules/asn1
	restify 4.3.4	restify
	p-limit 1.2.0	p-limit
	async 2.4.0	getos/node_modules/async
	getos 3.1.0	getos
	strip-ansi 3.0.1	wrap-ansi/node_modules/strip-ansi
	ansi-regex 2.1.1	wrap-ansi/node_modules/ansi-regex
	is-fullwidth-code-point 1.0.0	wrap-ansi/node_modules/is-fullwidth-code-point
	string-width 1.0.2	wrap-ansi/node_modules/string-width
	wrap-ansi 2.1.0	wrap-ansi
	json-stringify-safe 5.0.1	json-stringify-safe
	get-caller-file 1.0.2	get-caller-file
	arrify 1.0.1	arrify
	ua-parser-js 0.7.17	ua-parser-js
	fast-deep-equal 1.0.0	fast-deep-equal
	graceful-fs 4.1.11	graceful-fs
	caller-path 0.1.0	caller-path
	glob-parent 5.1.0	glob-parent
	has-flag 3.0.0	has-flag
	spdy 3.4.7	spdy
	color-name 1.1.3	color-name
	whatwg-fetch 2.0.3	whatwg-fetch
	is-stream 1.1.0	is-stream
	forever-agent 0.6.1	forever-agent
	keep-alive-agent 0.0.1	keep-alive-agent
	require-main-filename 1.0.1	require-main-filename
	flat-cache 1.3.0	flat-cache
	pluralize 7.0.0	pluralize
	pinkie-promise 2.0.1	pinkie-promise
	text-table 0.2.0	text-table
	chardet 0.4.2	chardet
	dashdash 1.14.1	dashdash
	async-limiter 1.0.0	async-limiter
	spdx-expression-parse 1.0.4	spdx-expression-parse
	loose-envify 1.3.1	loose-envify
	@babel/runtime 7.8.7	@babel/runtime
	@babel/code-frame 7.8.3	@babel/code-frame
	js-tokens 4.0.0	@babel/highlight/node_modules/js-tokens
	@babel/highlight 7.8.3	@babel/highlight
	create-output-stream 0.0.1	create-output-stream
	debug 3.1.0	engine.io/node_modules/debug
	engine.io 3.2.0	engine.io
	espree 3.5.3	espree
	shebang-command 1.2.0	shebang-command
	is-promise 2.1.0	is-promise
	eslint-config-airbnb-base 12.1.0	eslint-config-airbnb-base
	normalize-path 3.0.0	normalize-path
	asap 2.0.6	asap
	path-is-absolute 1.0.1	path-is-absolute
	progress 2.0.0	progress
	ansi-escape-sequences 5.1.2	ansi-escape-sequences
	readable-stream 2.3.2	readable-stream
	del 2.2.2	del
	component-emitter 1.2.1	component-emitter
	signal-exit 3.0.2	signal-exit
	sax 1.2.4	sax
	jsbn 0.1.1	jsbn
	ip-cidr 2.0.7	ip-cidr
	parse-json 2.2.0	parse-json
	nan 2.14.0	mmmagic/node_modules/nan
	mmmagic 0.5.3	mmmagic
	supports-color 5.2.0	supports-color
	tar-stream 1.6.2	tar-stream
	to-array 0.1.4	to-array
	csv-parse 1.3.3	csv-parse
	mem 1.1.0	mem
	array-back 4.0.1	array-back
	tar-fs 1.16.3	tar-fs
	promise 7.3.1	promise
	typedarray 0.0.6	typedarray
	buffer-alloc 1.2.0	buffer-alloc
	tough-cookie 2.3.4	tough-cookie
	callsites 3.1.0	parent-module/node_modules/callsites
	parent-module 1.0.1	parent-module
	split-ca 1.0.1	split-ca
	please-upgrade-node 3.2.0	please-upgrade-node
	lcid 1.0.0	lcid
	mkdirp 0.5.1	mkdirp
	braces 3.0.2	braces
	natural-compare 1.4.0	natural-compare
	ignore 3.3.7	ignore
	string.prototype.codepointat 0.2.0	string.prototype.codepointat
	damerau-levenshtein 1.0.4	damerau-levenshtein
	object-assign 4.1.1	object-assign
	strip-eof 1.0.0	strip-eof
	resolve-from 1.0.1	resolve-from
	eslint-scope 3.7.1	eslint-scope
	util-deprecate 1.0.2	util-deprecate
	asynckit 0.4.0	asynckit
	pify 2.3.0	pify
	better-assert 1.0.2	better-assert
	mime-types 2.1.18	mime-types
	csv-stringify 0.0.8	csv-stringify
	shebang-regex 1.0.0	shebang-regex
	js-yaml 3.9.1	node-yaml/node_modules/js-yaml
	esprima 4.0.0	node-yaml/node_modules/esprima
	node-yaml 3.1.1	node-yaml
	pseudomap 1.0.2	pseudomap
	os-tmpdir 1.0.2	os-tmpdir
	escape-string-regexp 1.0.5	escape-string-regexp
	bcrypt-pbkdf 1.0.1	bcrypt-pbkdf
	resolve 1.5.0	resolve
	isexe 2.0.0	isexe
	asn1 0.2.3	asn1
	contains-path 0.1.0	contains-path
	foreach 2.0.5	foreach
	slash 3.0.0	slash
	sprintf-js 1.1.2	sprintf-js
	ansi-regex 2.1.1	has-ansi/node_modules/ansi-regex
	has-ansi 2.0.0	has-ansi
	picomatch 2.2.1	picomatch
	chownr 1.1.4	chownr
	end-of-stream 1.4.4	end-of-stream
	minimatch 3.0.4	minimatch
	uuid 3.2.1	uuid
	mv 2.1.1	mv
	p-try 1.0.0	p-try
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
