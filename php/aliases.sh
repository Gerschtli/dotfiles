if available php || available hhvm; then
    alias com="composer"
    alias cinstall="composer install"
    alias cupdate="composer update"

    alias behat="./bin/behat -vvv"

    function ut() {
        if [[ -x "./bin/phpunit" ]]; then
            ./bin/phpunit "${@}"
        else
            ./vendor/bin/phpunit "${@}"
        fi
    }

    if available phpenmod && available phpdismod; then
        alias phpenxdebug="sudo phpenmod -s cli xdebug"
        alias phpdisxdebug="sudo phpdismod -s cli xdebug"
    fi
fi
