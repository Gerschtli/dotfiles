if is_osx; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi

alias la="ls -AFv"
alias ll="ls -AFhlv"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias sort-vn="sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

if available nvim || available vim; then
    export EDITOR="nvim"
    alias e="${EDITOR}"
fi

available xdg-open && alias open="xdg-open"

available dircolors && eval "$(dircolors -b)"

available bc && alias bc="bc -l"

if available pwgen; then
    alias pwgen="pwgen -cny"
    alias pwgens="pwgen -s"
fi
