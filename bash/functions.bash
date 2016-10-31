shell-reload() {
    [[ -r "${HOME}/.profile" ]]      && source "${HOME}/.profile"
    [[ -r "${HOME}/.bash_profile" ]] && source "${HOME}/.bash_profile"
    [[ -r "${HOME}/.bashrc" ]]       && source "${HOME}/.bashrc"
}
