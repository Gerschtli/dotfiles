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
        local args=()
        local cmd_set=false
        local nix_shell_command="pnix-shell"

        while [[ $# -gt 1 ]]; do
            shift
            key=$1
            case $key in
                --clean)
                    clean=1
                    args+=(--clean)
                    ;;
                --command)
                    shift
                    if [[ -z $1 ]]; then
                        echo "Command has to be specified" >&2
                        return 1
                    fi
                    args+=(--command "$1")
                    cmd_set=true
                    ;;
                *)
                    args+=($key)
                    nix_shell_command="nix-shell"
                    ;;
            esac
        done

        if ! $cmd_set; then
            args+=(--command zsh)
        fi

        ${nix_shell_command} "$(nshell-path "${profile}")" ${args}
    }
fi
