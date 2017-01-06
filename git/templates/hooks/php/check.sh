#!/bin/bash

GIT_DIR="${GIT_DIR:-${PWD}/.git}"

source "${GIT_DIR}"/hooks/base/change_detector.sh

build_php()
{
    COMPOSER_JSON="${PWD}"/composer.json
    COMPOSER_LOCK="${PWD}"/composer.lock
    if [ -e "${COMPOSER_JSON}" -a -e "${COMPOSER_LOCK}" ] &&
        has_changed ${1} "${COMPOSER_JSON}" "${COMPOSER_LOCK}"; then
        "${GIT_DIR}"/hooks/php/composer.sh
    fi
}

if hash php > /dev/null 2>&1; then
    build_php
fi
