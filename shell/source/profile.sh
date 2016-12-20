# remove existing keys
if [[ ${SHLVL} -eq 1 ]] && avaiable keychain; then
    keychain --clear --quiet
fi

umask 022
