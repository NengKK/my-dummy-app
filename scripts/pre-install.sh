#!/bin/bash

echo "HELLO, FROM PREINSTALL PHASE"

if [ "$STAGE" = "production" ]; then
    echo stage="$STAGE"
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json
elif [ "$STAGE" = "test" ]; then
    echo stage="$STAGE"
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json
else
    echo stage="$STAGE"
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json
fi