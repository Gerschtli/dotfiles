#!/bin/bash

BUILD_FILE="${PWD}"/build.xml

if hash ant > /dev/null 2>&1 &&
    [[ -e "${BUILD_FILE}" && $(grep '<target name="check"' "${BUILD_FILE}" | wc -l) != 0 ]]; then
    ant check; RESULT=$?
else
    RESULT=0
fi

exit ${RESULT}
