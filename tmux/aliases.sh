if available tmux; then
    alias tmux="tmux -2"

    if is_osx; then
        alias reattach-to-user-namespace="exec reattach-to-user-namespace -l zsh"
    fi
if
