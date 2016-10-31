shell-reload() {
    [[ -r "${HOME}/.zprofile" ]] && source "${HOME}/.zprofile"
    [[ -r "${HOME}/.zshenv" ]]   && source "${HOME}/.zshenv"
    [[ -r "${HOME}/.zshrc" ]]    && source "${HOME}/.zshrc"
}
