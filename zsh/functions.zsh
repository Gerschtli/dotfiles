available() {
    return $(which "${1}" > /dev/null 2>&1)
}

function is_ssh() {
    p=${1:-$PPID}
    read pid name x ppid y < <( cat /proc/$p/stat )
    [[ "$name" =~ sshd ]] && return 0
    [ "$ppid" -le 1 ]     && return 1
    is_ssh $ppid
}
