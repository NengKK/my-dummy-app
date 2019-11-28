#!/usr/bin/env bash

echo CIRCLE_BRANCH=$CIRCLE_BRANCH

if [ "${CIRCLE_BRANCH}" = "production" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json;
elif [ "${CIRCLE_BRANCH}" = "master" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json;
else
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json;
fi