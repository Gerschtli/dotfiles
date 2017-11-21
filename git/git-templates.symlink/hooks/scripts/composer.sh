#!/usr/bin/env bash

source "${PWD}"/.git/hooks/scripts/util.sh

COMPOSER_DIR="${PWD}"/bin
COMPOSER_JSON="${PWD}"/composer.json
COMPOSER_LOCK="${PWD}"/composer.lock
COMPOSER="${COMPOSER_DIR}"/composer

download() {
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

install() {
    if has_changed "${COMPOSER_LOCK}"; then
        php "${COMPOSER}" install --optimize-autoloader --prefer-source
    fi
}

check() {
    if "${COMPOSER}" list | has_match "check\s+Run the check script as defined in composer.json."; then
        "${COMPOSER}" check; RESULT=$?
    fi
}

if has_command_and_file php "${COMPOSER_JSON}"; then
    download

    case "${HOOK_TYPE}" in
        post-checkout | post-merge) install ;;
        pre-push)                   check   ;;
    esac
fi

exit ${RESULT}
