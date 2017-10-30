#!/usr/bin/env bash

if [[ $OSTYPE = darwin* ]]; then
  git config --global credential.helper osxkeychain
else
  # diff-so-fancy
  wget -nc https://ppa.launchpadcontent.net/aos1/diff-so-fancy/ubuntu/pool/main/d/diff-so-fancy/diff-so-fancy_1.4.4-1ubuntu1_all.deb
  sudo dpkg -i diff-so-fancy_1.4.4-1ubuntu1_all.deb
  rm diff-so-fancy_1.4.4-1ubuntu1_all.deb
fi

ln -sfn "$HOME/.dotfiles/git/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$HOME/.dotfiles/git/.gitignore_global" "$HOME/.gitignore_global"
