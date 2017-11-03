#!/usr/bin/env bash

HOOK_TYPE="${1}"
OLD_REF="${2}"
NEW_REF="${3}"

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

has_changed() {
    [[ -z "${OLD_REF}" && -z "${NEW_REF}" ]] || \
        git diff --name-only $OLD_REF..$NEW_REF | grep -e "^composer.lock$" > /dev/null 2>&1
}

composer_install() {
    if has_changed; then
        php "${COMPOSER}" install --optimize-autoloader --prefer-source
    fi
}

composer_check() {
    if [ $("${COMPOSER}" list | egrep "check\s+Run the check script as defined in composer.json." | wc -l) != 0 ]; then
        "${COMPOSER}" check; RESULT=$?
    fi
}

if hash php > /dev/null 2>&1 && [ -e "${COMPOSER_JSON}" ]; then
    install_composer

    case "${HOOK_TYPE}" in
        post-checkout | post-merge)
            composer_install
            ;;
        pre-push)
            composer_check
            ;;
    esac
fi

exit ${RESULT}
