[[ -n "${key[Up]}"     ]] && bindkey "${key[Up]}"     history-search-backward
[[ -n "${key[Down]}"   ]] && bindkey "${key[Down]}"   history-search-forward
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char

if [[ "${terminfo[kdch1]}" != "" ]]; then
    bindkey "${terminfo[kdch1]}" delete-char
fi
