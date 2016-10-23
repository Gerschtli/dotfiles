FILE="${DOTFILES_ROOT}/nodejs/completion.sh"

if available npm && [[ ! -r "${FILE}" ]]; then
    npm completion > "${FILE}"
fi

unset FILE
