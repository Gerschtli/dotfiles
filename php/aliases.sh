if available php; then
    alias composer='./bin/composer'
    alias cinstall='composer --prefer-source --optimize-autoloader install'
    alias cupdate='composer --prefer-source --optimize-autoloader update'
    alias csupdate='composer self-update'
    alias ut='./bin/phpunit'

    cdownload() {
        if [ ! -e "bin/composer" ]; then
            php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

            local EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
            local ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

            if [[ "${EXPECTED_SIGNATURE}" == "${ACTUAL_SIGNATURE}" ]]; then
                mkdir -p bin
                php ./composer-setup.php --install-dir=bin --filename=composer
            fi

            rm -f ./composer-setup.php
        fi
    }

    if available phpenmod && available phpdismod; then
        alias phpenxdebug='sudo phpenmod -s cli xdebug'
        alias phpdisxdebug='sudo phpdismod -s cli xdebug'
    fi
fi
