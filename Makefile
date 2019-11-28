#!/usr/bin/env bash

set_stage:
	if [ "${CIRCLE_BRANCH}" = "poc" ]; \
		then export STAGE=test; \
	elif [ "${CIRCLE_BRANCH}" = "master" ]; \
		then export STAGE=latest; \
	elif [ "${CIRCLE_BRANCH}" = "production" ]; \
		then export STAGE=production; \
	else \
		export STAGE=test; \
	fi

install:
	npm rebuild node-sass
	# if node_modules are present, npm i will be faster, otherwise npm ci will be faster
	# (if npm version does not support ci command, install current npm version)
	if [ -d node_modules ]; \
		then npm i; \
		else npm ci || npx npm@latest ci; \
	fi