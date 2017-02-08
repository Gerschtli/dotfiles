#!/bin/bash

PACKAGE_JSON="${PWD}"/package.json

RESULT=0

npm_test() {
    if [ $(npm run | grep "  test" | wc -l) != 0 ]; then
        npm test; RESULT=$?
    fi
}

if hash npm > /dev/null 2>&1 && [ -e "${PACKAGE_JSON}" ]; then
    case "${1}" in
        post-checkout | post-merge)
            npm install
            ;;
        pre-push)
            npm_test
            ;;
    esac
fi

exit ${RESULT}
