if available php; then
    alias composer='./bin/composer.phar'
    alias cinstall='composer --prefer-source install'
    alias cupdate='composer --prefer-source update'
    alias cdownload='mkdir -p bin; curl -sS https://getcomposer.org/installer | php -- --install-dir=bin'

    alias ut='./bin/phpunit'
fi
