if available nix-shell; then
    nshell-path() {
        if [[ "${1}" == "./shell" ]]; then
            echo "$(pwd)/shell.nix"
            return
        fi

        local profile="${1}"
        local pattern="${DOTFILES_ROOT}/nix/profiles/%s.nix"
        printf "${pattern}" "${profile}"
    }

    nshell() {
        if [[ ! -z "${NIX_SHELL}" ]]; then
            echo "Already in nix-shell! [${NIX_SHELL}]" >&2 && return 1
        fi

        local profile="${1:-./shell}"
        local clean
        if [[ "${2}" == "--clean" ]]; then
            clean="--clean"
            shift
        fi
        local args="${@:2}"

        if [[ -z "${args}" ]]; then
            pnix-shell "$(nshell-path "${profile}")" ${clean}
        else
            nix-shell "$(nshell-path "${profile}")" --command zsh "${args}"
        fi
    }
fi
