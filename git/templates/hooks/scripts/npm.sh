#!/bin/bash

PACKAGE_JSON="${PWD}"/package.json

if hash npm > /dev/null 2>&1 && [ -e "${PACKAGE_JSON}" ] &&
    [ $(npm run | grep "  test" | wc -l) != 0 ]; then
    npm test; RESULT=$?
else
    RESULT=0
fi

exit ${RESULT}
