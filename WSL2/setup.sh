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
  shellcheck \
  software-properties-common \
  tk-dev

# wslutils
wget -O - https://pkg.wslutiliti.es/public.key | sudo gpg -o /usr/share/keyrings/wslu-archive-keyring.pgp --dearmor
echo "deb [signed-by=/usr/share/keyrings/wslu-archive-keyring.pgp] https://pkg.wslutiliti.es/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") main" | sudo tee /etc/apt/sources.list.d/wslu.list
sudo apt update
sudo apt install wslu -y --no-install-recommends

# pyenv
git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
cd "$HOME/.pyenv" && src/configure && make -C src

# nodenv
git clone https://github.com/nodenv/nodenv.git "$HOME/.nodenv"
cd "$HOME/.nodenv" && src/configure && make -C src
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build

# rbenv
git clone https://github.com/rbenv/rbenv.git "$HOME/.rbenv"
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# goenv
git clone https://github.com/go-nv/goenv.git "$HOME/.goenv"
