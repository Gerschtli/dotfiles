_d_register_fpath "${DOTFILES_ROOT}/nix/completion"

DIR="${HOME}/.nix-profile/share/zsh/site-functions"

if [[ -d "${DIR}" ]]; then
    _d_register_fpath "${DIR}"
fi

unset DIR
