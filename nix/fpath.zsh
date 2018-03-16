_d_register_fpath "${DOTFILES_ROOT}/nix/completion"

DIR="${HOME}/.nix-profile/share/zsh/site-functions"

if [[ -d "${DIR}" ]]; then
    _d_register_fpath "${DIR}"
fi

# is set in nix.shell
if [[ ! -z "${buildInputs}" ]]; then
    for buildInput in "${(ps: :)buildInputs}"; do
        DIR="${buildInput}/share/zsh/site-functions"
        if [[ -d "${DIR}" ]]; then
            _d_register_fpath "${DIR}"
        fi

        DIR="${buildInput}/share/zsh/${ZSH_VERSION}/functions"
        if [[ -d "${DIR}" ]]; then
            _d_register_fpath "${DIR}"
        fi
    done
fi

unset DIR
