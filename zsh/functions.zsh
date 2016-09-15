available() {
    which "${1}" > /dev/null 2>&1
}

is_osx() {
    [[ "$(uname -s)" == "Darwin" ]]
}

# to open a new tab in the current directory on osx
if is_osx; then
    precmd() {
        print -Pn "\e]2; %~/ \a"
    }
    preexec() {
        print -Pn "\e]2; %~/ \a"
    }
fi
