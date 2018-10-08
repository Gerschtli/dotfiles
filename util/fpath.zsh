for dir in "${EXTENDED_FPATH[@]}"; do
    _d_register_fpath "${dir}"
done
unset dir
