### Added by zinit's installer
source ~/.local/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk

zinit light zsh-users/zsh-history-substring-search

## Dir
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

## Powerlevel10k
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# Fzf
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice pick"shell/completion.zsh" src"shell/key-bindings.zsh"
zinit light junegunn/fzf

## LS_COLORS
zinit ice atclone"gdircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" menu select matcher-list "m:{a-zA-Z}={A-Za-z}"; \
        zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"'
zinit light trapd00r/LS_COLORS

## autocompletion
zinit snippet OMZ::lib/completion.zsh

zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
        OMZP::colored-man-pages \
    as"completion" \
        OMZ::plugins/terraform/_terraform \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions
