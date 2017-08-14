if _d_has_option "nix:source-nix-sh"; then
    source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
fi

# used for .desktop files
export XDG_DATA_DIRS="${HOME}/.nix-profile/share:${XDG_DATA_DIRS}"
