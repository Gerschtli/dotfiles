#!/usr/bin/env bash

source "${PWD}"/.git/hooks/scripts/util.sh

BUILD_FILE="${PWD}"/pom.xml

check() {
    mvn test integration-test; RESULT=$?
}

if has_command_and_file mvn "${BUILD_FILE}"; then
    case "${HOOK_TYPE}" in
        pre-push) check ;;
    esac
fi

exit ${RESULT}
