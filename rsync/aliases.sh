if available rsync; then
    OPTIONS="-avru --delete --chmod=\"ug=rwX,o=rX\" --cvs-exclude --whole-file \
        --exclude-from ${DOTFILES_ROOT}/rsync/rsync-ignore"
    alias rsa="rsync ${OPTIONS} ./ vagrant@admin.local.de:/var/www/htdocs"
    alias rsb="rsync ${OPTIONS} ./ vagrant@backend.local.local:/var/www/htdocs"
    alias rsf="rsync ${OPTIONS} ./ vagrant@preisvergleich.local.org:/var/www/htdocs"
    alias rsp="rsync ${OPTIONS} ./ vagrant@profitmax.local.de:/var/www/htdocs"
    unset OPTIONS
fi
