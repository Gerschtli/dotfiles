DIR="/usr/local/share/zsh/site-functions"

if is_osx && [[ -d "${DIR}" ]]; then
    fpath=($fpath "${DIR}")
fi

unset DIR
