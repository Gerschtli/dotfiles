if available ruby && available gem; then
    EXTENDED_PATH+=("$(ruby -rubygems -e 'puts Gem.user_dir')/bin")
fi
