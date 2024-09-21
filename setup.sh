#!/usr/bin/env bash

echo "Setting up your Mac..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/src"

# Keep sudo priv until script is done
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

OS=$(uname -o)
if [ "$OS" = "Darwin" ]; then
  # Set Mac OS Default
  # Install Brew & Bundle Brewfile
  source "$HOME/.dotfiles/macos/set-defaults.sh"
  source "$HOME/.dotfiles/brew/setup.sh"
else
  source "$HOME/.dotfiles/linux/setup.sh"
fi

source "$HOME/.dotfiles/git/setup.sh"

# Make ZSH the default shell environment
chsh -s "$(which zsh)"

# Install Antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git "$HOME/.antidote"
ln -sfn "$HOME/.dotfiles/zsh/.zsh_plugins.txt" "$HOME/.zsh_plugins.txt"

# Symlink dotfiles
ln -sfn "$HOME/.dotfiles/zsh/zshrc.zsh" "$HOME/.zshrc"
ln -sfn "$HOME/.dotfiles/zellij" "$HOME/.config/zellij"
ln -sfn "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -sfn "$HOME/.dotfiles/alacritty" "$HOME/.config/alacritty"
ln -sfn "$HOME/.dotfiles/k9s" "$HOME/.config/k9s"

echo "Done"
