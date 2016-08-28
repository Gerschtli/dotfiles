if available vagrant; then
    alias vcon="vagrant ssh-config --host vagrant >| .vagrant/ssh_config"
    alias vdes="vagrant destroy"
    alias vhalt="vagrant halt"
    alias vpro="vagrant provision"
    alias vssh="vagrant ssh"
    alias vst="vagrant status"
    alias vup="vagrant up"
fi
