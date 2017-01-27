#!/usr/bin/env bash

set -e

source "$(dirname "$0")/util/dotfiles-variables.symlink"
source "${DOTFILES_ROOT}/util/script-functions"

BACKUP_SUFFIX=".backup"
declare -A links

if [[ -r "${CACHE_FILE}" ]]; then
    while read -r line; do
        linkname="${line##*:}"
        target="${line%:*}"
        if [[ $(_d_get_symlink_target "${linkname}") == "${target}" ]]; then
            links["${linkname}"]="${target}"
        else
            _d_remove_line_in_cache "${linkname}"
        fi
    done < "${CACHE_FILE}"
fi

# link files with symlink suffix
for target in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f -name '*.symlink'); do
    if _d_use_module "${target}"; then
        linkname="${HOME}/.$(basename "${target%.*}")"
        _d_link_file "${target}" "${linkname}"
    fi
done

# link bin files
for target in "${DOTFILES_ROOT}"/*/bin/*; do
    if _d_use_module "${target%/*}"; then
        linkname="${DOTFILES_ROOT}/bin/${target##*/}"
        _d_link_file "${target}" "${linkname}"
    fi
done

# source symlinker
_d_source_files -name "symlinker"

# remove old links
for old_linkname in "${!links[@]}"; do
    if [[ $(_d_get_symlink_target "${old_linkname}") == "${links["${old_linkname}"]}" ]]; then
        if $(rm "${old_linkname}"); then
            _d_remove_line_in_cache "${old_linkname}"
            _d_success "Removed link %s" "${old_linkname}"

            if [[ -e "${old_linkname}${BACKUP_SUFFIX}" ]]; then
                if $(mv "${old_linkname}${BACKUP_SUFFIX}" "${old_linkname}"); then
                    _d_success "Restored backup %s" "${old_linkname}${BACKUP_SUFFIX}"
                else
                    _d_error "Backup could not be moved: %s" "${old_linkname}${BACKUP_SUFFIX}"
                    FAIL=true
                fi
            fi
        else
            _d_error "Link could not be deleted: %s" "${old_linkname}"
            FAIL=true
        fi
    else
        _d_remove_line_in_cache "${old_linkname}"
        _d_info "%s is not a link to %s, updating cache" "${old_linkname}" "${links["${old_linkname}"]}"
    fi
done

if [[ ! -z "${FAIL}" ]]; then
    _d_error "=> An error occured during linking process. Please consider the log above."
    exit 1
fi

exit 0
