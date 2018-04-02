ROOT="${HOME}/projects/serversetup"

if [[ "${ARG_OPTION}" == "--no-vagrant" ]]; then
    PRESET="git-single"
else
    LAYOUT="even-horizontal"

    PANE_CMDS=("git fm" "vup")
fi
