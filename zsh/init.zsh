FILE="${DOTFILES_ROOT}/zsh/completion/_docker-compose"

if [[ ! -r "${FILE}" ]]; then
    curl -L https://raw.githubusercontent.com/docker/compose/1.24.0/contrib/completion/zsh/_docker-compose > "${FILE}"
fi

unset FILE
