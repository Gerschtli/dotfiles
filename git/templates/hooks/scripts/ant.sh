#!/bin/bash

if hash ant > /dev/null 2>&1 && [ -e "${PWD}"/build.xml ]; then
    ant check; RESULT=$?
else
    RESULT=0
fi

exit ${RESULT}
