if available git; then
    git-hooks-reload() {
        local hooks_dir="${PWD}/.git/hooks"
        if [[ ! -d "${hooks_dir}" ]]; then
            echo "folder ${hooks_dir} does not exist."
            return 1
        fi
        rm -r "${hooks_dir}"
        git init --template="${DOTFILES_ROOT}/git/templates"
    }

    git-hooks-reload-all() {
        local list
        list=("${DOTFILES_ROOT}")
        [[ -d "${DOTFILES_ROOT}/gpg" ]] && list+=("${DOTFILES_ROOT}/gpg")
        [[ -d "${DOTFILES_ROOT}/ssh" ]] && list+=("${DOTFILES_ROOT}/ssh")
        [[ -d "${HOME}/projects" ]]     && list+=("${HOME}/projects/"*/)
        [[ -d "${HOME}/projects/cbn" ]] && list+=("${HOME}/projects/cbn/"*/)

        local dir
        for dir in "${list[@]}"; do
            if [[ -d "${dir}/.git" ]]; then
                pushd "${dir}" 1> /dev/null
                git-hooks-reload
                popd 1> /dev/null
            fi
        done
    }
fi
