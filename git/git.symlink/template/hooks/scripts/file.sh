#!/usr/bin/env sh

GIT="git"

# workaround for messed up PATH, don't use atom's git
if ! $(git --version > /dev/null 2>&1); then
    GIT=$(which -a git | head -n 2 | tail -n 1)
fi

if $GIT rev-parse --verify HEAD >/dev/null 2>&1; then
    against=HEAD
else
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

allownonascii=$($GIT config --bool hooks.allownonascii)
exec 1>&2

if [ "$allownonascii" != "true" ] &&
    test $($GIT diff --cached --name-only --diff-filter=A -z $against \
        | LC_ALL=C tr -d '[ -~]\0' | wc -c) != 0; then
    cat << \EOF
Error: Attempt to add a non-ASCII file name.
This can cause problems if you want to work with people on other platforms.
To be portable it is advisable to rename the file.
If you know what you are doing you can disable this check using:
    git config hooks.allownonascii true
EOF
    exit 1
fi

exec $GIT diff-index --check --cached $against --
