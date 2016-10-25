for dir in "${EXTENED_PATH[@]}"; do
    if [[ -d "${dir}" && "${PATH}" != "${dir}":* ]]; then
        export PATH="${dir}:${PATH}"
    fi
done

unset dir
