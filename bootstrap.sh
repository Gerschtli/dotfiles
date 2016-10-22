#!/bin/bash -e

if [[ -r "${HOME}/.localrc" ]]; then
    source "${HOME}/.localrc"
fi

DOTFILES_ROOT="${DOTFILES_ROOT:-$( cd "$(dirname "$0")" && pwd -P )}"
DISABLE_MODULES="${DISABLE_MODULES:-()}"

source "${DOTFILES_ROOT}/util/script-functions.sh"

link_file() {
    local src="${1}"
    local dst="${2}"

    if [[ $(readlink -f "${dst}") == "${src}" ]]; then
        return
    fi

    UPDATE=true

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
    if use_module "${src}"; then
        dst="${HOME}/.$(basename "${src%.*}")"
        link_file "${src}" "${dst}"
    fi
done

for symlink in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name 'symlink.sh'); do
    if use_module "${symlink}"; then
        source "${symlink}"
    fi
done

if [[ -z "${UPDATE}" ]]; then
    success "-> No links updated"
elif [[ -z "${FAIL}" ]]; then
    success "-> All files linked"
else
    error "-> An error occured during linking process. Please consider the log above."
    exit 1
fi

exit 0
