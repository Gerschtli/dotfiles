_d_rprompt() {
    if [[ ! -z "${IN_NIX_SHELL}" && ! -z "${name}" && "${name}" != lorri-keep-env-hack-* ]]; then
        echo " %B[%F{green}${name}%f]%b"
    fi
}

RPROMPT="$(_d_rprompt)"
