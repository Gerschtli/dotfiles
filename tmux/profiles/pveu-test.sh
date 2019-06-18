source "${DOTFILES_ROOT}/tmux/util/helpers.sh"

CMD_PRIMARY="$(_cmds \
    "ssh pveu.test.backend" \
    "./install/list.sh" \
)"
CMD_SECONDARY="$(_cmds \
    "ssh pveu.test.frontend" \
    "./install/list.sh" \
)"
