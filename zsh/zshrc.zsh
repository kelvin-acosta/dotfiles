# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# dotfiles
source "$HOME/.dotfiles/zsh/iterm2_shell_integration.zsh"
source "$HOME/.dotfiles/zsh/options.zsh"
source "$HOME/.dotfiles/zsh/bindings.zsh"
source "$HOME/.dotfiles/zsh/env.zsh"
source "$HOME/.dotfiles/zsh/alias.zsh"
source "$HOME/.cargo/env"

# Antidote
## source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

## initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

eval "$(direnv hook zsh)"
eval "$(pyenv init - zsh)"
eval "$(rbenv init - zsh)"
eval "$(nodenv init - zsh)"
eval "$(goenv init - zsh)"

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
