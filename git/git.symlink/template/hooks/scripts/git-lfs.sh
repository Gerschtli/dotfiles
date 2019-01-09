#!/usr/bin/env bash

source "${PWD}/.git/hooks/helpers/util.sh"

if has_command git-lfs; then
    case "${HOOK_TYPE}" in
        post-checkout | post-commit | post-merge | pre-push) git lfs "$@" ;;
    esac
fi

exit ${RESULT}
