[[ -n "${key[Up]}"     ]] && bindkey "${key[Up]}"     history-search-backward
[[ -n "${key[Down]}"   ]] && bindkey "${key[Down]}"   history-search-forward
[[ -n "${key[Delete]}" ]] && bindkey "${key[Delete]}" delete-char
