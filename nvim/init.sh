PLUG_PATH="${DOTFILES_ROOT}/nvim/nvim/autoload/plug.vim"

if [[ ! -r "${PLUG_PATH}" ]]; then
    curl -Lo "${PLUG_PATH}" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi

unset PLUG_PATH
