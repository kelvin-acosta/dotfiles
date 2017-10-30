#!/usr/bin/env bash

# Set base directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BASE_DIR="$( dirname "$DIR" )"

# Check for Homebrew and install if we don't have it
if test ! "$(which brew)"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file="$BASE_DIR/brew/Brewfile"

# Create .fzf if it doesn't exist
[[ -f ~/.fzf.zsh ]] || fzf --zsh > ~/.fzf.zsh

mkdir -p ~/.docker/cli-plugins
ln -sfn "${HOMEBREW_PREFIX}/opt/docker-buildx/bin/docker-buildx" "${HOME}/.docker/cli-plugins/docker-buildx"
ln -sfn "${HOMEBREW_PREFIX}/opt/docker-compose/bin/docker-compose" "${HOME}/.docker/cli-plugins/docker-compose"
