# remove existing keys
if [[ ${SHLVL} -eq 1 ]] && available keychain; then
    keychain --clear --quiet
fi

umask 022
