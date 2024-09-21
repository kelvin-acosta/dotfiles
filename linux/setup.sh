#!/usr/bin/env bash

# Keep sudo priv until script is done
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo usermod -aG sudo kelvin
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install zsh -y --no-install-recommends

(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

sudo apt-get install -y --no-install-recommends \
  apt-transport-https \
  build-essential \
  clang \
  direnv \
  fuse \
  gnupg2 \
  jq \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libncurses-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxrender1 \
  libyaml-dev \
  libz-dev \
  lsof \
  make \
  man-db \
  openssl \
  postgresql-client \
  ripgrep \
  shellcheck \
  software-properties-common \
  tk-dev \
  unzip

# Install zellij
ZELLIJ_VERSION="0.40.1"
pushd /tmp || exit
  wget --no-verbose -nc "https://github.com/zellij-org/zellij/releases/download/v${ZELLIJ_VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz"
  tar -xvf zellij*.tar.gz
  rm zellij*.tar.gz
  chmod +x zellij
  sudo mv -f zellij /usr/bin/zellij
popd || exit

# https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package
NVIM_VERSION="0.10.1"
pushd /tmp || exit
  wget --no-verbose -nc https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv -f nvim.appimage /usr/bin/nvim
popd || exit

mkdir -p "$HOME/.config"
ln -sfn "$HOME/.dotfiles/nvim" "$HOME/.config/"

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
"$HOME/.fzf/install" --all

# wslutils
wget --no-verbose -O - https://pkg.wslutiliti.es/public.key | sudo gpg --yes -o /usr/share/keyrings/wslu-archive-keyring.pgp --dearmor
echo "deb [signed-by=/usr/share/keyrings/wslu-archive-keyring.pgp] https://pkg.wslutiliti.es/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") main" | sudo tee /etc/apt/sources.list.d/wslu.list
sudo apt update
sudo apt install wslu -y --no-install-recommends

# mise https://mise.jdx.dev/getting-started.html#_1-install-mise-cli
curl -sSfL https://mise.run | sh

# rust
curl --proto '=https' --tlsv1.2 -sSfL https://sh.rustup.rs | sh -s -- -y

# mojo
curl -sSfL https://get.modular.com | sh -

# ruff
curl -sSfL https://astral.sh/ruff/install.sh | sh
