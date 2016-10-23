source "${DOTFILES_ROOT}/zsh/functions.zsh"

print() {
    echo -e "[\033[00;${2}m${3}\033[0m] ${1}"
}

info() {
    print "${1}" "34" "INFO"
}

success() {
    print "${1}" "32" " OK "
}

error() {
    print "${1}" "31" "FAIL"
}

use_module() {
    local file="${1}"
    local directory="${file%/*}"
    local module="${directory##*/}"
    [[ "${MODULES}" =~ "${module}" ]]
}

source_files() {
    for file in $(find "${DOTFILES_ROOT}" -maxdepth 2 -type f $@); do
        if use_module "${file}"; then
            source "${file}"
        fi
    done
}
