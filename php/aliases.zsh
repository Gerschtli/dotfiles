if available php; then
    alias com='bin/composer.phar'
    alias com-install='com --prefer-source install'
    alias com-update='com --prefer-source update'
    alias com-download='mkdir -p bin; curl -sS https://getcomposer.org/installer | php -- --install-dir=bin'

    alias ut='./bin/phpunit'
fi
