HOME_BIN="${HOME}/bin"
DOTFILES_BIN="${DOTFILES_ROOT}/bin"

if [[ -d "${HOME}/bin" && "${PATH}" != "${HOME_BIN}":* ]]; then
    export PATH="${HOME}/bin:${PATH}"
fi
if [[ "${PATH}" != "${DOTFILES_BIN}":* ]]; then
    export PATH="${DOTFILES_ROOT}/bin:${PATH}"
fi

unset HOME_BIN DOTFILES_BIN
