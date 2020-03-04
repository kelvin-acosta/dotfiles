### Added by zinit's installer
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk

zinit light zsh-users/zsh-history-substring-search

## Dir
zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

## Starship Prompt
zinit from"gh-r" as"program" mv"starship* -> starship" \
    atclone'./starship init zsh > zhook.zsh' atpull'%atclone' \
    pick"starship" src="zhook.zsh" for \
        starship/starship

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

# OMZ Plugins
zinit wait lucid for \

## autocompletion
zinit snippet OMZ::lib/completion.zsh
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
        OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    as"completion" \
        OMZ::plugins/docker/_docker \
    blockf \
        zsh-users/zsh-completions \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions
