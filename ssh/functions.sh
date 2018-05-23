keygen() {
    if [[ -z "${1}" ]]; then
        echo "Enter path  as argument!"
    else
        ssh-keygen -t rsa -b 4096 -f "${1}"
    fi
}
