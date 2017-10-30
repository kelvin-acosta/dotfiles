#!/usr/bin/env bash

echo "Setting up..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/src"

# Keep sudo priv until script is done
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if [[ $OSTYPE = darwin* ]]; then
  # Set Mac OS Default
  # Install Brew & Bundle Brewfile
  source "$HOME/.dotfiles/macos/set-defaults.sh"
  source "$HOME/.dotfiles/brew/setup.sh"
else
  source "$HOME/.dotfiles/linux/setup.sh"
fi

source "$HOME/.dotfiles/git/setup.sh"

# Make ZSH the default shell environment
sudo chsh -s "$(which zsh)"

# Symlink dotfiles
ln -sfn "$HOME"/.dotfiles/zsh/.* "$ZDOTDIR"
ln -sfn "$HOME"/.dotfiles/zsh/.zshenv "$HOME/.zshenv"
ln -sfn "$HOME"/.dotfiles/nvim "$HOME/.config/nvim"
ln -sfn "$HOME"/.dotfiles/ghostty "$HOME/.config/ghostty"
ln -sfn "$HOME"/.dotfiles/k9s "$HOME/.config/k9s"

echo "Done"
