#!/usr/bin/env bash

source "${PWD}"/.git/hooks/scripts/util.sh

PACKAGE_JSON="${PWD}"/package.json

install() {
    if has_changed "${PACKAGE_JSON}"; then
        npm install
    fi
}

check() {
    if npm run | has_match "  test"; then
        npm test; RESULT=$?
    fi
}

if has_command_and_file npm "${PACKAGE_JSON}"; then
    case "${HOOK_TYPE}" in
        post-checkout | post-merge) install ;;
        pre-push)                   check   ;;
    esac
fi

exit ${RESULT}
