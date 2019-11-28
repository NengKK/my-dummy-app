#!/usr/bin/env bash

if [ "${STAGE}" = "production" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json;
elif [ "${STAGE}" = "test" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json;
else
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json;
fi