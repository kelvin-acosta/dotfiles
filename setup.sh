#!/usr/bin/env bash

echo "Setting up..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/src"

# Keep sudo priv until script is done
sudo -v

while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

if [[ $OSTYPE = darwin* ]]; then
  # Set Mac OS Default
  # Install Brew & Bundle Brewfile
  source "$HOME/.dotfiles/macos/set-defaults.sh"
  source "$HOME/.dotfiles/brew/setup.sh"
else
  source "$HOME/.dotfiles/omarchy/setup.sh"
fi

# Make ZSH the default shell environment
chsh -s "$(which zsh)"

if type fzf &>/dev/null; then
  fzf --zsh >"$HOME/.fzf.zsh"
fi

stow git
stow .

echo "Done"
