#!/usr/bin/env bash

echo "Setting up your Mac..."

# Keep sudo priv until script is done
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set Mac OS Default
source $HOME/.dotfiles/macos/set-defaults.sh

source $HOME/.dotfiles/brew/setup.sh

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Create a Projects directory
mkdir $HOME/Projects

# Symlink dotfiles
ln -sfn $HOME/.dotfiles/git/.gitconfig $HOME/.gitconfig
ln -sfn $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global
ln -sfn $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
ln -sfn $HOME/.dotfiles/zsh/zshrc.zsh $HOME/.zshrc
ln -sfn $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
