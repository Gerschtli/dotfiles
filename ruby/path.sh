if available ruby && available gem; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:${PATH}"
fi
