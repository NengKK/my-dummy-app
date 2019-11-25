#!/bin/bash

echo "HELLO, FROM POST-INSTALL"

if [ "$CIRCLE_BRANCH" = "production" ]; then
    echo "$CIRCLE_BRANCH"
	npm install git+ssh://git@github.com/NengKK/dummy-package.git#production
elif [ "$CIRCLE_BRANCH" = "test-branch-changing" ]; then
    echo "$CIRCLE_BRANCH"
	npm install git+ssh://git@github.com/NengKK/dummy-package.git#poc
else
    echo "$CIRCLE_BRANCH"
	npm install git+ssh://git@github.com/NengKK/dummy-package.git
fi