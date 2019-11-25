#!/bin/bash

echo "HELLO, FROM POST-INSTALL"

if [ "$ENV" = "PROD" ]; then
    echo "PRODUCTION"
	npm install git+ssh://git@github.com/NengKK/dummy-package.git#production
elif [ "$ENV" = "POC" ]; then
    echo "POC"
	npm install git+ssh://git@github.com/NengKK/dummy-package.git#poc
else
    echo "MASTER"
	npm install git+ssh://git@github.com/NengKK/dummy-package.git
fi