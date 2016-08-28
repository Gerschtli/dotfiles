#!/bin/bash

DOTFILES_ROOT="$( cd "$(dirname "$0")" ; pwd -P )"


if ! $(which is_ssh > /dev/null 2>&1); then
    source "${DOTFILES_ROOT}/zsh/functions.zsh"
fi


print() {
    printf "  [\033[00;${2}m${3}\033[0m] ${1}\n"
}

info() {
    print "${1}" "34" "INFO"
}

success() {
    print "${1}" "32" " OK "
}

link_file() {
    local src="${1}"
    local dst="${2}"

    if [[ -e  "${dst}" && ! -L "${dst}" ]]; then
        mv "${dst}" "${dst}.backup"
        info "Moved $dst to ${dst}.backup"
    fi

    ln -snf "${src}" "${dst}"
    success "Linked ${src} to ${dst}"
}

for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name '*.symlink'); do
    dst="${HOME}/.$(basename "${src%.*}")"
    link_file "${src}" "${dst}"
done

if ! is_ssh; then
    for symlink in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name 'symlink.sh'); do
        source "${symlink}"
    done
fi

success "All files linked"

exit 0
