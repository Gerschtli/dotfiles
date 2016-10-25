DOTFILES_BIN="${DOTFILES_ROOT}/bin"

for dir in "${HOME}"{/local,}/bin; do
    if [[ -d "${dir}" && "${PATH}" != "${dir}":* ]]; then
        export PATH="${dir}:${PATH}"
    fi
done

if [[ "${PATH}" != "${DOTFILES_BIN}":* ]]; then
    export PATH="${DOTFILES_ROOT}/bin:${PATH}"
fi

unset dir DOTFILES_BIN
