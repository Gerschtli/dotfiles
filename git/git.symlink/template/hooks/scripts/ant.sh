#!/usr/bin/env bash

source "${PWD}/.git/hooks/helpers/util.sh"

BUILD_FILE="${PWD}/build.xml"

check() {
    if has_match '<target name="check"' "${BUILD_FILE}"; then
        ant check; track_result
    fi
}

if has_command_and_file ant "${BUILD_FILE}"; then
    case "${HOOK_TYPE}" in
        pre-push) check ;;
    esac
fi

exit ${RESULT}
