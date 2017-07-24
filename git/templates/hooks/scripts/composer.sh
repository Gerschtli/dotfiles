#!/usr/bin/env bash

COMPOSER_DIR="${PWD}"/bin
COMPOSER_JSON="${PWD}"/composer.json
COMPOSER="${COMPOSER_DIR}"/composer

RESULT=0

install_composer() {
    if [ ! -x "${COMPOSER}" ]; then
        test ! -d "${COMPOSER_DIR}" && mkdir "${COMPOSER_DIR}"
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

        EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
        ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

        if [ "${EXPECTED_SIGNATURE}" = "${ACTUAL_SIGNATURE}" ]; then
            php ./composer-setup.php --install-dir="${COMPOSER_DIR}" --filename=composer || exit $?
        fi

        rm -f ./composer-setup.php
    fi
}

composer_check() {
    if [ $("${COMPOSER}" list | egrep "check\s+Run the check script as defined in composer.json." | wc -l) != 0 ]; then
        "${COMPOSER}" check; RESULT=$?
    fi
}

if hash php > /dev/null 2>&1 && [ -e "${COMPOSER_JSON}" ]; then
    install_composer

    case "${1}" in
        post-checkout | post-merge)
            APPLICATION_ENV=test php "${COMPOSER}" install --optimize-autoloader --prefer-source
            ;;
        pre-push)
            composer_check
            ;;
    esac
fi

exit ${RESULT}
