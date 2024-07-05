#!/usr/bin/env bash

# https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package
NVIM_VERSION="0.10.0"
pushd /tmp || exit
  wget -nc https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv nvim.appimage /usr/bin/nvim
popd || exit

mkdir -p "$HOME/.config/nvim"
ln -sfn "$HOME/.dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
