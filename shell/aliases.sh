if is_osx; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi

alias la="ls -AFv"
alias ll="ls -AFhlv"

alias cp="cp -av"
alias mv="mv -v"
alias rm="rm -v"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias sort-vn="sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias e="${EDITOR}"

available xdg-open && alias open="xdg-open"

available dircolors && eval "$(dircolors -b)"

available bc && alias bc="bc -l"

if available tree; then
    alias tree="tree -F --dirsfirst"
    alias treea="tree -a"
fi

if available pwgen; then
    alias pwgen="pwgen -cny"
    alias pwgens="pwgen -s"
fi
