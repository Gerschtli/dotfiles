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
        local profile="${1:-./shell}"
        local -a args
        local cmd_set=0
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
                    cmd_set=1
                    ;;
                *)
                    args+=($key)
                    nix_shell_command="nix-shell"
                    ;;
            esac
        done

        if [[ "$cmd_set" == 0 ]]; then
            args+=(--command zsh)
        fi

        ${nix_shell_command} "$(nshell-path "${profile}")" ${args}
    }
fi
