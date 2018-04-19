if _d_has_option "nix:source-nix-sh"; then
    source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
    hash -f
fi
