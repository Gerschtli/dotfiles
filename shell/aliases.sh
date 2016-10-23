if is_osx; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi

alias la="ls -AFv"
alias ll="ls -AFhlv"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

available xdg-open && alias open="xdg-open"

available dircolors && eval "$(dircolors -b)"
