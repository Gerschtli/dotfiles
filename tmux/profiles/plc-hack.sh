ROOT="${HOME}/projects/plc-web-hack"
TITLE="plc-hack"

LAYOUT="even-horizontal"

PANE_CMDS=("git fm" "nixops/manage dev start:nixops/manage dev ssh plc-hack:journalctl -xef")

NIX_PROFILE="."
