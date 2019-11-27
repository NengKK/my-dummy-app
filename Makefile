#!/usr/bin/env bash

switch_branch:
	if [ "${STAGE}" = "production" ]; then \
		sed -i -e 's/winston.git/winston.git#winston1/g' ./package.json \
	elif [ "${STAGE}" = "test" ]; then \
		sed -i -e 's/winston.git/winston.git#winston2/g' ./package.json \
	else \
		sed -i -e 's/winston.git/winston.git/g' ./package.json \
	fi

install:
	npm rebuild node-sass
	# if node_modules are present, npm i will be faster, otherwise npm ci will be faster
	# (if npm version does not support ci command, install current npm version)
	if [ -d node_modules ]; \
		then npm i; \
		else npm ci || npx npm@latest ci; \
	fi