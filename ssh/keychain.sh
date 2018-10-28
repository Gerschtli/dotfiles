if available keychain; then
    kadd() {
        local key="$(find "${DOTFILES_ROOT}/ssh/modules" -type f -name "id_rsa.${1}" | head -n 1)"

        if [[ ! -r "${key}" ]]; then
            echo "ssh key not found: ${key}"
        else
            if [[ -z "${_D_KEYCHAIN_EVAL}" ]]; then
                eval $(keychain --agents ssh --eval --quiet)
                _D_KEYCHAIN_EVAL=1
            fi

            keychain "${key}"
        fi

        if [[ $# > 1 ]]; then
            kadd "${@:2}"
        fi
    }
fi
