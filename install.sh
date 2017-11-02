#!/bin/sh

echo "Setting up your Mac..."

# Keep sudo priv until script is done
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes     
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Projects directory
mkdir $HOME/Projects

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlink dotfiles
ln -sfn $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
ln -sfn $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -sfn $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
ln -sfn $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
ln -sfn $HOME/.dotfiles/.vimrc $HOME/.vimrc
ln -sfn $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Set global gitignore
git config --global core.excludesfile ~/.gitignore_global

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

source .macos
