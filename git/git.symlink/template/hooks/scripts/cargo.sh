#!/usr/bin/env bash

source "${PWD}/.git/hooks/helpers/util.sh"

CONFIG_FILE="${PWD}/Cargo.toml"

check() {
    cargo fmt -- --write-mode=diff; track_result
    cargo build; track_result
    if $(cargo --list | grep clippy > /dev/null 2>&1); then
        cargo clippy; track_result
    fi
    cargo test; track_result
}

if has_command_and_file cargo "${CONFIG_FILE}"; then
    case "${HOOK_TYPE}" in
        pre-push) check ;;
    esac
fi

exit ${RESULT}
