#!/usr/bin/env bash

echo STAGE=$STAGE

if [ "${STAGE}" = "test" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json;
elif [ "${STAGE}" = "latest" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json;
elif [ "${STAGE}" = "production" ]; then
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json;
else
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json;
fi