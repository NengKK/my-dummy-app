#!/bin/bash

echo "HELLO, FROM PREINSTALL PHASE"

if [ "$STAGE" = "production" ]; then
    echo "stage=production"
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json
elif [ "$STAGE" = "test" ]; then
    echo "stage=test"
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json
else
    echo "stage=rc or latest"
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json
fi