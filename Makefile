#!/usr/bin/env bash

install:
	chmod -R 755 ./scripts
	npm rebuild node-sass
	# if node_modules are present, npm i will be faster, otherwise npm ci will be faster
	# (if npm version does not support ci command, install current npm version)
	if [ -d node_modules ]; \
		then npm i; \
		else npm ci || npx npm@latest ci; \
	fi