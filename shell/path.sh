for dir in "${EXTENDED_PATH[@]}"; do
    if [[ -d "${dir}" && "${PATH}" != "${dir}":* && "${PATH}" != *:"${dir}":* ]]; then
        export PATH="${dir}:${PATH}"
    fi
done

unset dir
