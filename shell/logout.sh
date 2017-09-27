[[ -e "${HOME}/.lesshst" ]]             && rm -f "${HOME}/.lesshst"
[[ -e "${HOME}/.xsession-errors.old" ]] && rm -f "${HOME}/.xsession-errors.old"
[[ -e "${HOME}/.zcompdump*" ]]          && rm -f "${HOME}/.zcompdump*"

[[ -x "/usr/bin/clear_console" ]] && clear_console -q
