if [[ -z "${PATH_LOADED}" ]]; then
    if [[ -d "${HOME}/bin" ]]; then
        export PATH="${HOME}/bin:${PATH}"
    fi
    export PATH="${DOTFILES_ROOT}/bin:${PATH}"
fi

PATH_LOADED=1
