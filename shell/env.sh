for dir in "${EXTENDED_PATH[@]}"; do
    if [[ -d "${dir}" && "${PATH}" =~ (^|:)"${dir}"(:|$) ]]; then
        export PATH="${dir}:${PATH}"
    fi
done
unset dir

export TZ="Europe/Berlin"

export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=de_DE.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_PAPER=de_DE.UTF-8
export LC_NAME=en_US.UTF-8
export LC_ADDRESS=en_US.UTF-8
export LC_TELEPHONE=en_US.UTF-8
export LC_MEASUREMENT=de_DE.UTF-8
export LC_IDENTIFICATION=en_US.UTF-8
export LC_ALL=

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export EDITOR="nvim"
