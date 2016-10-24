if available rsync; then
    rsc() {
        local conf="rsync.conf"
        if [[ -r "${conf}" ]]; then
            rsync -avru --delete --chmod="ug=rwX,o=rX" --cvs-exclude --whole-file \
                --exclude-from "${DOTFILES_ROOT}/rsync/rsync-ignore" $(cat "${conf}")
        else
            echo "${conf} not found, aborting..."
        fi
    }
fi
