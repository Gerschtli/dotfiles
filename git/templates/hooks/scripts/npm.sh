#!/usr/bin/env bash

HOOK_TYPE="${1}"
OLD_REF="${2}"
NEW_REF="${3}"

PACKAGE_JSON="${PWD}"/package.json

RESULT=0

has_changed() {
    [[ -z "${OLD_REF}" && -z "${NEW_REF}" ]] || \
        git diff --name-only $OLD_REF..$NEW_REF | grep -e "^package.json$" > /dev/null 2>&1
}

npm_install() {
    if has_changed; then
        npm install
    fi
}

npm_test() {
    if [ $(npm run | grep "  test" | wc -l) != 0 ]; then
        npm test; RESULT=$?
    fi
}

if hash npm > /dev/null 2>&1 && [ -e "${PACKAGE_JSON}" ]; then
    case "${HOOK_TYPE}" in
        post-checkout | post-merge)
            npm_install
            ;;
        pre-push)
            npm_test
            ;;
    esac
fi

exit ${RESULT}
