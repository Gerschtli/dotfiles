# remove existing keys
if [[ ${SHLVL} -eq 1 ]] && available keychain; then
    keychain --clear --quiet
fi

umask 022


for dir in "${EXTENDED_PATH[@]}"; do
    if [[ -d "${dir}" && ! "${PATH}" =~ (^|:)"${dir}"(:|$) ]]; then
        export PATH="${dir}:${PATH}"
    fi
done
unset dir
