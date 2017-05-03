if available vim && _d_has_option "nvim:enable-vim"; then
    # vim config
    alias vimplugupdate="vim +PlugUpgrade +PlugInstall +PlugUpdate +qall"
fi

if available nvim && ! _d_has_option "nvim:disable-nvim"; then
    # nvim config
    alias nvplugupdate="nvim +PlugUpgrade +PlugInstall +PlugUpdate +qall"
fi
