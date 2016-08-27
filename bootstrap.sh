#!/bin/bash

DOTFILES_ROOT="$( cd "$(dirname "$0")" ; pwd -P )"

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

    if [[ -f "${dst}" && ! -L "${dst}" ]]; then
        mv "${dst}" "${dst}.backup"
        info "moved $dst to ${dst}.backup"
    fi

    ln -snf "${src}" "${dst}"
    success "linked ${src} to ${dst}"
}

for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name '*.symlink'); do
    dst="${HOME}/.$(basename "${src%.*}")"
    link_file "${src}" "${dst}"
done

exit 0
