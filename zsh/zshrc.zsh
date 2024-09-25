[[ ! -f ~/.dotfiles/zsh/prompt/init.zsh ]] || source ~/.dotfiles/zsh/prompt/init.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"
eval "$(mise activate zsh)"

# dotfiles
source "$HOME/.dotfiles/zsh/options.zsh"
source "$HOME/.dotfiles/zsh/bindings.zsh"
source "$HOME/.dotfiles/zsh/alias.zsh"
source "$HOME/.dotfiles/zsh/env.zsh"

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Antidote
## source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

unset ZSH_AUTOSUGGEST_USE_ASYNC

autoload -Uz promptinit && promptinit && prompt powerlevel10k
