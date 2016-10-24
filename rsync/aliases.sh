if available rsync; then
    OPTIONS="-avru --delete --chmod=\"ug=rwX,o=rX\" --cvs-exclude --whole-file \
        --exclude-from ${DOTFILES_ROOT}/rsync/rsync-ignore"

    alias rs="rsync ${OPTIONS}"

    function rsc() {
        local conf="rsync.conf"
        if [[ -r "${conf}" ]]; then
            rs "$(cat "${conf}")"
        else
            echo "${conf} not found, aborting..."
        fi
    }

    alias rsa="echo -e 'deprecated, use\n\techo \". vagrant@admin.local.de:/var/www/htdocs\" > rsync.conf' \
        && rs . vagrant@admin.local.de:/var/www/htdocs"
    alias rsb="echo -e 'deprecated, use\n\techo \". vagrant@adminbackend.local.localde:/var/www/htdocs\" > rsync.conf' \
        && rs . vagrant@backend.local.local:/var/www/htdocs"
    alias rsf="echo -e 'deprecated, use\n\techo \". vagrant@adminpreisvergleich.local.orgde:/var/www/htdocs\" > rsync.conf' \
        && rs . vagrant@preisvergleich.local.org:/var/www/htdocs"
    alias rsp="echo -e 'deprecated, use\n\techo \". vagrant@profitmax.local.de:/var/www/htdocs\" > rsync.conf' \
        && rs . vagrant@profitmax.local.de:/var/www/htdocs"
    unset OPTIONS
fi
