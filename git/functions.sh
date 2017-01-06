if available git; then
    git-hooks-reload() {
        local hooks_dir="${PWD}/.git/hooks"
        if [[ ! -d "${hooks_dir}" ]]; then
            echo "folder ${hooks_dir} does not exist."
            return 1
        fi
        rm -r "${hooks_dir}"
        git init
    }
fi
