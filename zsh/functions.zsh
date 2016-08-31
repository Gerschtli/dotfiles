available() {
    return $(which "${1}" > /dev/null 2>&1)
}

is_ssh() {
    p=${1:-$PPID}
    # read pid name x ppid y < <( cat /proc/$p/stat )
    read pid name ppid < <(ps -o pid= -o comm= -o ppid= -p $p)
    [[ "$name" =~ sshd ]] && return 0
    [ "$ppid" -le 1 ]     && return 1
    is_ssh $ppid
}

is_osx() {
    return $([[ "$(uname -s)" == "Darwin" ]])
}

# to open a new tab in the current directory on osx
if is_osx; then
    precmd() {
        print -Pn "\e]2; %~/ \a"
    }
    preexec() {
        print -Pn "\e]2; %~/ \a"
    }
fi
