#!/usr/bin/env bash

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p "$HOME/.config/nvim"
ln -sfn "$HOME/.dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
