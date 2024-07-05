#!/usr/bin/env bash

echo "Setting up your Mac..."

# Keep sudo priv until script is done
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

OS=$(uname -o)
if [ "$OS" = "Darwin" ]; then
  # Set Mac OS Default
  # Install Brew & Bundle Brewfile
  source $HOME/.dotfiles/macos/set-defaults.sh
  source $HOME/.dotfiles/brew/setup.sh
fi

# Setup nvim
source "$HOME/.dotfiles/nvim/setup.sh"

# Make ZSH the default shell environment
chsh -s " $(which zsh)"

# Install Antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-~}/.antidote"
ln -sfn "$HOME/.dotfiles/zsh/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"

# Create a src dir
mkdir -p "$HOME/src"

# Symlink dotfiles
ln -sfn "$HOME/.dotfiles/zsh/zshrc.zsh" "$HOME/.zshrc"

echo "Done"
