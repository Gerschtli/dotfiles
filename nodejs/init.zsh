FILE="${DOTFILES_ROOT}/nodejs/completion.zsh"

if available npm && [[ ! -r "${FILE}" ]]; then
    npm completion > "${FILE}"
fi

unset FILE
