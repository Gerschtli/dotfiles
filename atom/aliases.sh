if available apm; then
    _D_ATOM_PACKAGE_LIST="${DOTFILES_ROOT}/atom/atom.symlink/package-list.txt"
    alias apm-export="apm list --installed --bare | sed -e '/^$/d' > ${_D_ATOM_PACKAGE_LIST}"
    alias apm-install="apm install --packages-file ${_D_ATOM_PACKAGE_LIST}"
fi
