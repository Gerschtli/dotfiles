#!/bin/bash -e

source "$(dirname "$0")/util/dotfiles-variables.symlink"
source "${DOTFILES_ROOT}/util/script-functions"

declare -A links

if [[ -r "${CACHE_FILE}" ]]; then
    while read -r line; do
        links["${line%:*}"]="${line##*:}"
    done < "${CACHE_FILE}"
fi

_d_link_file() {
    local src="${1}"
    local dst="${2}"

    if [[ "${links["${src}"]}" == "${dst}" ]]; then
        unset links["${src}"]
        return
    fi

    echo "${src}:${dst}" >> "${CACHE_FILE}"

    if [[ -e  "${dst}" && ! -L "${dst}" ]]; then
        mv "${dst}" "${dst}.backup"
        _d_info "Moved $dst to ${dst}.backup"
    fi

    if $(ln -snf "${src}" "${dst}"); then
        _d_success "Linked ${src} to ${dst}"
    else
        _d_error "Failed linking ${src} to ${dst}"
        FAIL=true
    fi
}

_d_remove_line_in_cache() {
    local tmp="$(mktemp)"

    egrep -v ".*:${1}$" "${CACHE_FILE}" > "${tmp}" \
        && mv "${tmp}" "${CACHE_FILE}"
}

# link files with symlink suffix
for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name '*.symlink'); do
    if _d_use_module "${src}"; then
        dst="${HOME}/.$(basename "${src%.*}")"
        _d_link_file "${src}" "${dst}"
    fi
done

# source symlinker
for symlink in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name 'symlinker'); do
    if _d_use_module "${symlink}"; then
        source "${symlink}"
    fi
done

# remove old links
for old_link in "${links[@]}"; do
    if [[ -L "${old_link}" ]]; then
        if $(rm "${old_link}"); then
            _d_remove_line_in_cache "${old_link}"
            _d_success "Removed link ${old_link}"

            if [[ -e "${old_link}.backup" ]]; then
                if $(mv "${old_link}.backup" "${old_link}"); then
                    _d_success "Restored backup ${old_link}.backup"
                else
                    _d_error "Backup could not be moved: ${old_link}.backup"
                    FAIL=true
                fi
            fi
        else
            _d_error "Link could not be deleted: ${old_link}"
            FAIL=true
        fi
    else
        _d_remove_line_in_cache "${old_link}"
        _d_info "${old_link} is not a link, updating cache"
    fi
done

if [[ ! -z "${FAIL}" ]]; then
    _d_error "-> An _d_error occured during linking process. Please consider the log above."
    exit 1
fi

exit 0
