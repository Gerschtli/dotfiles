if [[ -r "${HOME}/.localrc" ]]; then
    source "${HOME}/.localrc"
fi

CACHE_FILE="${CACHE_FILE:-${HOME}/.dotfiles-cache}"
DISABLE_MODULES="${DISABLE_MODULES:-()}"
DOTFILES_ROOT="${DOTFILES_ROOT:-${HOME}/.dotfiles}"
PROJECTS="${PROJECTS:-${HOME}/projects}"
