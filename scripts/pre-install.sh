#!/bin/bash

echo "HELLO, FROM PREINSTALL PHASE"

if [ "$STAGE" = "production" ]; then
    sed -i -e 's/winston.git/winston.git#winston1/g' ./package.json
elif [ "$STAGE" = "test" ]; then
    sed -i -e 's/winston.git/winston.git#winston2/g' ./package.json
else
    sed -i -e 's/winston.git/winston.git/g' ./package.json
fi