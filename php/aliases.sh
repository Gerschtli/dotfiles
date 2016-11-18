if available php; then
    alias composer='./bin/composer.phar'
    alias cinstall='composer --prefer-source --optimize-autoloader install'
    alias cupdate='composer --prefer-source --optimize-autoloader update'
    alias csupdate='composer self-update'
    alias cdownload='mkdir -p bin && curl -sS "https://getcomposer.org/installer" | php -- --install-dir=bin'

    alias ut='./bin/phpunit'

    if available phpenmod && available phpdismod; then
        alias phpenxdebug='sudo phpenmod -s cli xdebug'
        alias phpdisxdebug='sudo phpdismod -s cli xdebug'
    fi
fi
