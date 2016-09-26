if available vagrant; then
    alias cdv="cd vagrant"

    alias vdes="vagrant destroy"
    alias vhalt="vagrant halt"
    alias vpro="vagrant provision"
    alias vrel="vagrant reload"
    alias vssh="vagrant ssh"
    alias vst="vagrant status"
    alias vup="vagrant up"

    alias cdvpro="cdv && vpro && cd -"
fi
