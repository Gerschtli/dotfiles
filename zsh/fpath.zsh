DIR="/usr/local/share/zsh/site-functions"

if is_osx && [[ -d "${DIR}" ]]; then
    _d_register_fpath "${DIR}"
fi

_d_register_fpath "${DOTFILES_ROOT}/zsh/zsh-completions/src"

unset DIR
