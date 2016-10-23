shell-reload() {
    [[ -r "${HOME}/.profile" ]] && source "${HOME}/.profile"
    [[ -r "${HOME}/.zshenv"  ]] && source "${HOME}/.zshenv"
    [[ -r "${HOME}/.zshrc"   ]] && source "${HOME}/.zshrc"
}
