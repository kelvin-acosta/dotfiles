eval "$(pyenv init --path)"

# Betterment
source "$HOME/.bootstrap/env.sh"

source $HOME/.dotfiles/zsh/env.zsh
source $HOME/.dotfiles/zsh/options.zsh
source $HOME/.dotfiles/zsh/bindings.zsh
source $HOME/.dotfiles/zsh/alias.zsh
source $HOME/.dotfiles/zsh/iterm2_shell_integration.zsh
source $HOME/.dotfiles/zsh/zinit.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"
