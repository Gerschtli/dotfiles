#!/bin/bash -e

if [[ -r "${HOME}/.localrc" ]]; then
    source "${HOME}/.localrc"
fi

DOTFILES_ROOT="${DOTFILES_ROOT:-$( cd "$(dirname "$0")" && pwd -P )}"
DISABLE_MODULES="${DISABLE_MODULES:-()}"

source "${DOTFILES_ROOT}/util/script-functions.sh"

declare -A links

if [[ -r "${CACHE_FILE}" ]]; then
    while read -r line; do
        links["${line%:*}"]="${line##*:}"
    done < "${CACHE_FILE}"
fi

link_file() {
    local src="${1}"
    local dst="${2}"

    if [[ "${links["${src}"]}" == "${dst}" ]]; then
        unset links["${src}"]
        return
    fi

    UPDATE=true
    echo "${src}:${dst}" >> "${CACHE_FILE}"

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

remove_line_in_cache() {
    local tmp="/tmp/dotfiles-cache"

    egrep -v ".*:${1}$" "${CACHE_FILE}" > "${tmp}" \
        && mv "${tmp}" "${CACHE_FILE}"
}

# link files with symlink suffix
for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name '*.symlink'); do
    if use_module "${src}"; then
        dst="${HOME}/.$(basename "${src%.*}")"
        link_file "${src}" "${dst}"
    fi
done

# source symlink.sh
for symlink in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name 'symlink.sh'); do
    if use_module "${symlink}"; then
        source "${symlink}"
    fi
done

# remove old links
for old_link in "${links[@]}"; do
    if [[ -L "${old_link}" ]]; then
        if $(rm "${old_link}"); then
            remove_line_in_cache "${old_link}"
            success "Removed link ${old_link}"

            if [[ -e "${old_link}.backup" ]]; then
                if $(mv "${old_link}.backup" "${old_link}"); then
                    success "Restored backup ${old_link}.backup"
                else
                    error "Backup could not be moved: ${old_link}.backup"
                    FAIL=true
                fi
            fi
        else
            error "Link could not be deleted: ${old_link}"
            FAIL=true
        fi
    else
        remove_line_in_cache "${old_link}"
        info "${old_link} is not a link, updating cache"
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
