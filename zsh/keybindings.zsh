autoload -Uz zkbd

bindkey '\e[A' up-line-or-search
bindkey '\e[B' down-line-or-search

[[ -n "${key[Up]}"     ]] && bindkey "${key[Up]}"     up-line-or-search
[[ -n "${key[Down]}"   ]] && bindkey "${key[Down]}"   down-line-or-search
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char

if [[ "${terminfo[kdch1]}" != "" ]]; then
    bindkey "${terminfo[kdch1]}" delete-char
fi
