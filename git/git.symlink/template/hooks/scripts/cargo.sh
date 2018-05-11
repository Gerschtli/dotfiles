#!/usr/bin/env bash

source "${PWD}/.git/hooks/helpers/util.sh"

CONFIG_FILE="${PWD}/Cargo.toml"

check() {
    cargo fmt -- --write-mode=diff; track_result
    cargo build --features dev; track_result
    cargo test; track_result
}

if has_command_and_file cargo "${CONFIG_FILE}"; then
    case "${HOOK_TYPE}" in
        pre-push) check ;;
    esac
fi

exit ${RESULT}
