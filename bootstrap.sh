#!/usr/bin/env bash

set -e

source "$(dirname "$0")/util/dotfiles-variables.symlink"
source "${DOTFILES_ROOT}/util/script-functions"

BACKUP_SUFFIX=".backup"
declare -A links

if [[ -r "${CACHE_FILE}" ]]; then
    while read -r line; do
        src="${line%:*}"
        destination="${line##*:}"
        if [[ $(_d_realpath "${destination}") == "${src}" ]]; then
            links["${destination}"]="${src}"
        else
            _d_remove_line_in_cache "${destination}"
        fi
    done < "${CACHE_FILE}"
fi

# link files with symlink suffix
for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -name '*.symlink'); do
    if _d_use_module "${src}"; then
        destination="${HOME}/.$(basename "${src%.*}")"
        _d_link_file "${src}" "${destination}"
    fi
done

# link files with symlink.config suffix
for src in $(find "${DOTFILES_ROOT}" -maxdepth 2 -name '*.symlink.config'); do
    if _d_use_module "${src}"; then
        mkdir -p "${HOME}/.config"
        destination="${HOME}/.config/$(basename "${src%.*.*}")"
        _d_link_file "${src}" "${destination}"
    fi
done

# source symlinker
for file in $(find "${DOTFILES_ROOT}" -mindepth 2 -maxdepth 2 -type f -name "symlinker" | sort); do
    if _d_use_module "${file}"; then
        source "${file}"
    fi
done

# remove old links
for old_destination in "${!links[@]}"; do
    if [[ $(_d_realpath "${old_destination}") == "${links["${old_destination}"]}" ]]; then
        if rm "${old_destination}"; then
            _d_remove_line_in_cache "${old_destination}"
            _d_success "Removed link %s" "${old_destination}"

            if [[ -e "${old_destination}${BACKUP_SUFFIX}" ]]; then
                if mv "${old_destination}${BACKUP_SUFFIX}" "${old_destination}"; then
                    _d_info "Restored backup %s" "${old_destination}${BACKUP_SUFFIX}"
                else
                    _d_error "Backup could not be moved: %s" "${old_destination}${BACKUP_SUFFIX}"
                    FAIL=true
                fi
            fi
        else
            _d_error "Link could not be deleted: %s" "${old_destination}"
            FAIL=true
        fi
    else
        _d_remove_line_in_cache "${old_destination}"
        _d_info "%s is not a link to %s, updating cache" "${old_destination}" "${links["${old_destination}"]}"
    fi
done

if [[ ! -z "${FAIL}" ]]; then
    _d_error "=> An error occured during linking process. Please consider the log above."
    exit 1
fi
