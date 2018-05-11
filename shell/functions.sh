available() {
    hash "${1}" > /dev/null 2>&1
}

dotupdate() {
    dotfiles-update "$1" && shell-reload
}

is_bash() {
    [[ -n "${BASH_VERSION-}" ]]
}

is_osx() {
    [[ "$(uname -s)" == "Darwin" ]]
}

is_zsh() {
    [[ -n "${ZSH_VERSION-}" ]]
}

# to open a new tab in the current directory on osx
if is_osx; then
    precmd() {
        print -Pn "\e]2; %~/ \a"
    }
    preexec() {
        print -Pn "\e]2; %~/ \a"
    }
fi
