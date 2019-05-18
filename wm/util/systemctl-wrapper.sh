systemctl_wrapper() {
    local action="${1}"
    local string="${2}"

    if zenity --question --text="Are you sure you want ${string}?" 2>/dev/null; then
        echo $(systemctl $action)
    fi
}
