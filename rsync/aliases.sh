if available rsync; then
    alias rsa="echo 'deprecated, use
        echo \". vagrant@admin.local.de:/var/www/htdocs\" > rsync.conf
        ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@admin.local.de
        rsc'"
    alias rsb="echo 'deprecated, use
        echo \". vagrant@backend.local.local:/var/www/htdocs\" > rsync.conf
        ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@backend.local.local
        rsc'"
    alias rsf="echo 'deprecated, use
        echo \". vagrant@preisvergleich.local.org:/var/www/htdocs\" > rsync.conf
        ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@preisvergleich.local.org
        rsc'"
    alias rsp="echo 'deprecated, use
        echo \". vagrant@profitmax.local.de:/var/www/htdocs\" > rsync.conf
        ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@profitmax.local.de
        rsc'"
fi
