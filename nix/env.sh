if _d_has_option "nix:source-nix-sh"; then
    if $(_d_is_addable_to_path "${HOME}/.nix-profile/bin"); then
        source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
    fi

    if is_zsh; then
        hash -f
    fi

    # see: https://github.com/NixOS/nixpkgs/issues/38991#issuecomment-400657551
    nix-build --no-out-link "<nixpkgs>" -A glibcLocales > /dev/null 2>&1

    export LOCALE_ARCHIVE_2_27="$(nix-build --no-out-link "<nixpkgs>" -A glibcLocales)/lib/locale/locale-archive"
    export LOCALE_ARCHIVE_2_11="/usr/bin/locale/locale-archive"
fi
