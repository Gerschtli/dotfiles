# hyphen-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# add list-colors
zstyle ':completion:*' list-colors ''

# highlight selected option
zstyle ':completion:*:*:*:*:*' menu select
