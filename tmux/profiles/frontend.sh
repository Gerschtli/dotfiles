ROOT="${HOME}/projects/pveu/frontend"

CMD_PRIMARY="git fm"
CMD_SECONDARY="cdv:while ! vst | grep running > /dev/null; do sleep 1; done:vssh:cd /var/www/htdocs:killall gulp:while true; do npm run watch; done"

SIDE_CMDS=("cdv:vup:vauto")
