# fix weird alt behavior
bindkey '^[f' forward-word
bindkey '^[b' backward-word

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[OA' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OB' history-substring-search-down

#
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

### ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# urxvt
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word

### ctrl+delete
bindkey "\e[3;5~" kill-word
# urxvt
bindkey "\e[3^" kill-word

### ctrl+backspace
bindkey '^H' backward-kill-word

### ctrl+shift+delete
bindkey "\e[3;6~" kill-line
# urxvt
bindkey "\e[3@" kill-line
