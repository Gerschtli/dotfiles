#!/bin/bash

COMPOSER_DIR="${PWD}"/bin
COMPOSER="${COMPOSER_DIR}"/composer

if [ ! -x "${COMPOSER}" ]; then
    test ! -d "${COMPOSER_DIR}" && mkdir "${COMPOSER_DIR}"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

    EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
    ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

    if [ "${EXPECTED_SIGNATURE}" = "${ACTUAL_SIGNATURE}" ]; then
        php ./composer-setup.php --install-dir="${COMPOSER_DIR}" --filename=composer --quiet || exit $?
    fi

    rm -f ./composer-setup.php
fi

php "${COMPOSER}" install --optimize-autoloader --prefer-source
