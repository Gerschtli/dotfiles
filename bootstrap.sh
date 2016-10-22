#!/bin/bash

if [[ -r "${HOME}/.localrc" ]]; then
    source "${HOME}/.localrc"
fi

DOTFILES_ROOT="$( cd "$(dirname "$0")" && pwd -P )"
FULL_LINK="${FULL_LINK:-1}"

print() {
    echo -e "[\033[00;${2}m${3}\033[0m] ${1}"
}

info() {
    print "${1}" "34" "INFO"
}

success() {
    print "${1}" "32" " OK "
}

error() {
    print "${1}" "31" "FAIL"
}

link_file() {
    local src="${1}"
    local dst="${2}"

    if [[ -e  "${dst}" && ! -L "${dst}" ]]; then
        mv "${dst}" "${dst}.backup"
        info "Moved $dst to ${dst}.backup"
    fi

    if $(ln -snf "${src}" "${dst}"); then
        success "Linked ${src} to ${dst}"
    else
        error "Failed linking ${src} to ${dst}"
        FAIL=true
    fi
}

for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name '*.symlink'); do
    dst="${HOME}/.$(basename "${src%.*}")"
    link_file "${src}" "${dst}"
done

if [[ "${FULL_LINK}" == "1" ]]; then
    source "${DOTFILES_ROOT}/zsh/functions.zsh"

    for symlink in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name 'symlink.sh'); do
        source "${symlink}"
    done
fi

if [[ -z "${FAIL}" ]]; then
    success "-> All files linked"
else
    error "-> An error occured during linking process. Please consider the log above."
fi

exit 0
