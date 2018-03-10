#!/usr/bin/env bash

source "${PWD}"/.git/hooks/scripts/util.sh

CONFIG_FILE="${PWD}"/Cargo.toml

check() {
    cargo fmt -- --write-mode=diff; RESULT=$((${RESULT} + $?))
    cargo build --features dev; RESULT=$((${RESULT} + $?))
    cargo test; RESULT=$((${RESULT} + $?))
}

if has_command_and_file cargo "${CONFIG_FILE}"; then
    case "${HOOK_TYPE}" in
        pre-push) check ;;
    esac
fi

exit ${RESULT}
