if available nix-shell; then
    bash-wrapped() {
        if [[ ! -z "${IN_NIX_SHELL}" ]]; then
            nix-shell -p bashInteractive --command bash
        else
            bash
        fi
    }

    nshell-path() {
        if [[ "${1}" == "." ]]; then
            [[ -r shell.nix ]] && echo "${PWD}/shell.nix" && return
            [[ -r default.nix ]] && echo "${PWD}/default.nix" && return
        fi

        local profile="${1}"
        local pattern="${DOTFILES_ROOT}/nix/profiles/%s.nix"
        printf "${pattern}" "${profile}"
    }

    nshell() {
        local profile="${1:-.}"
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

        ${nix_shell_command} "$(nshell-path "${profile}")" "${args[@]}"
    }

    nshell-update() {
        find ~/.nix-shell -name "shell.drv" \
            | grep -v "\.dotfiles/nix/profiles" \
            | sed -e "s,${HOME}/.nix-shell,,g" -e "s,\(.*\)/.*/shell.drv$,\1,g" \
            | xargs -I {} zsh --interactive -c "cd {} && echo '===== {} =====' && nshell . --clean --command exit"

        find ~/.nix-shell -name "shell.drv" \
            | grep "\.dotfiles/nix/profiles" \
            | sed -e "s,.*/\.dotfiles/nix/profiles/,,g" -e "s,\.nix/shell\.drv,,g" \
            | xargs -I {} zsh --interactive -c "echo '===== {} =====' && nshell {} --clean --command exit"
    }
fi
