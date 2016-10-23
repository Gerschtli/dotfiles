if is_osx; then
    alias ls="ls -G"
else
    alias ls="ls --color=auto"
fi

alias la="ls -AFv"
alias ll="ls -AFhlv"

alias grep="grep --color=auto"

available xdg-open && alias open="xdg-open"
