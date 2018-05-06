if available php || available hhvm; then
    alias cinstall="composer --prefer-source --optimize-autoloader install"
    alias cupdate="composer --prefer-source --optimize-autoloader update"

    alias behat="./bin/behat -vvv"
    alias ut="./bin/phpunit"

    if available phpenmod && available phpdismod; then
        alias phpenxdebug="sudo phpenmod -s cli xdebug"
        alias phpdisxdebug="sudo phpdismod -s cli xdebug"
    fi
fi
