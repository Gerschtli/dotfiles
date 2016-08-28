# hyphen-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'

# add list-colors
zstyle ':completion:*' list-colors ''

# highlight selected option
zstyle ':completion:*:*:*:*:*' menu select
