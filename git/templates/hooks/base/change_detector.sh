#!/bin/bash

has_changed()
{
    local hook_type=${1}
    shift
    local monitored_paths=("$@")
    local against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
    local changed=0

    monitored_paths=( "${monitored_paths[@]/#/${GIT_DIR}/../}" )

    case $hook_type in
        post-commit)
            git rev-parse --verify HEAD^ >/dev/null 2>&1 && against=HEAD^
            changed="$(git diff-tree $against 'HEAD' --stat -- ${monitored_paths[*]} | wc -l)"
            ;;
        post-checkout | post-merge )
            changed="$(git diff 'HEAD@{1}' --stat -- ${monitored_paths[*]} | wc -l)"
            ;;
        pre-commit)
            git rev-parse --verify HEAD >/dev/null 2>&1 && against=HEAD
            changed="$(git diff-index --name-status ${against} -- "${monitored_paths[*]}" | wc -l)"
            ;;
    esac

    return ${changed}
}
