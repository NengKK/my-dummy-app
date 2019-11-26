#!/bin/bash

echo "HELLO, FROM PRE-INSTALL"

if [ "$CIRCLE_BRANCH" = "production" ]; then
    echo "$CIRCLE_BRANCH"
    sed -i -e 's/dummy-package.git/dummy-package.git#production/g' ./package.json
elif [ "$CIRCLE_BRANCH" = "test-branch-changing" ]; then
    echo "$CIRCLE_BRANCH"
    sed -i -e 's/dummy-package.git/dummy-package.git#poc/g' ./package.json
else
    echo "$CIRCLE_BRANCH"
    sed -i -e 's/dummy-package.git/dummy-package.git/g' ./package.json
fi