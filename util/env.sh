for dir in "${EXTENDED_PATH[@]}"; do
    if _d_is_addable_to_path "${dir}"; then
        export PATH="${dir}:${PATH}"
    fi
done
unset dir
