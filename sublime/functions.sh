init-rsync-sftp() {
    local host="${1}"
    if [[ $# != 1 ]]; then
        echo "provide host as argument"
    else
        echo ". vagrant@${host}:/var/www/htdocs" > rsync.conf
        sed "s/<host>/${host}/g" "${DOTFILES_ROOT}/sublime/User/sftp-config.json.dist" > sftp-config.json
    fi
}
