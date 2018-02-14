ROOT="${HOME}/projects/serversetup"
TITLE="serversetup"

if [[ "${ARG_OPTION}" == "--no-vagrant" ]]; then
    PRESET="git-single"
else
    LAYOUT="even-horizontal"

    PANE_CMDS=("git fm" "vup")
fi

NIX_PROFILE="."
