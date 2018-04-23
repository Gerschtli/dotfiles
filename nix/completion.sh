if available fzf-share; then
    SUFFIX=zsh
    if is_bash; then
        SUFFIX=bash
    fi

    for file in "$(fzf-share)/"*".${SUFFIX}"; do
        source "${file}"
    done
fi

unset file SUFFIX
