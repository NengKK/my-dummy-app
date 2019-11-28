#!/usr/bin/env bash

if [ ! -z "$CIRCLE_CI" ]
    then
        if [ "${CIRCLE_CI}" = "poc" ]; then
            export STAGE=test;
        elif [ "${CIRCLE_CI}" = "master" ]; then
            export STAGE=latest;
        elif [ "${CIRCLE_CI}" = "production" ]; then
            export STAGE=production;
        else
            export STAGE=test;
        fi
fi

if [ "${STAGE}" = "test" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json;
elif [ "${STAGE}" = "latest" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json;
elif [ "${STAGE}" = "production" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json;
else
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json;
fi