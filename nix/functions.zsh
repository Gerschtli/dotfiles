if available nix-shell; then
    nshell() {
        local profile="${1}"
        nix-shell "${DOTFILES_ROOT}/nix/profiles/${profile}.nix" --command zsh "${@:2}"
    }
fi
