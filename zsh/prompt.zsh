_d_rprompt() {
    if [[ ! -z "${NIX_SHELL}" ]]; then
        echo " %B[%F{green}${NIX_SHELL}%f]%b"
    fi
}

RPROMPT="$(_d_rprompt)"
