# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ${ZDOTDIR:-$HOME}/.zstyles ]] || source ${ZDOTDIR:-$HOME}/.zstyles

# Clone antidote if necessary.
if [[ ! -d ${ZDOTDIR:-$HOME}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-$HOME}/.antidote
fi

# # Antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

ZSH_HIGHLIGHT_STYLES[comment]='fg=#414868'

# Source anything in .zshrc.d.
for _rc in ${ZDOTDIR:-$HOME}/.zshrc.d/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# mise
if type mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

[[ ! -f ~/.bootstrap/env.sh ]] || source "$HOME/.bootstrap/env.sh"

[[ ! -f ~/.local/share/omarchy/default/bash/functions ]] || source "$HOME/.local/share/omarchy/default/bash/functions"

# # fzf
[[ ! -f ~/.fzf.zsh ]] || source ~/.fzf.zsh

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source ${ZDOTDIR:-$HOME}/.p10k.zsh
