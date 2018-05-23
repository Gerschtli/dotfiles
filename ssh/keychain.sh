if available keychain; then
    eval $(keychain --agents ssh --eval --quiet)

    kadd() {
        local key="$(find "${DOTFILES_ROOT}/ssh/modules" -type f -name "id_rsa.${1}" | head -n 1)"

        if [[ ! -r "${key}" ]]; then
            echo "ssh key not found: ${key}"
        else
            keychain "${key}"
        fi

        if [[ $# > 1 ]]; then
            kadd "${@:2}"
        fi
    }
fi
