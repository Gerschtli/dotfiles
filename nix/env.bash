if _d_has_option "nix:source-nix-sh" && available direnv; then
    eval "$(direnv hook bash)"
fi
