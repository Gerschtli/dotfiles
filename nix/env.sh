if _d_has_option "nix:source-nix-sh"; then
    if $(_d_is_addable_to_path "${HOME}/.nix-profile/bin"); then
        source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
    fi

    if is_zsh; then
        hash -f
    fi
fi
