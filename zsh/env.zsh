# Setting and editing of env variables.

# VARS
export EDITOR='vim'
export SUDO_EDITOR='vim'
export DOTFILES="$HOME/.dotfiles"

# LS COLOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.rbenv/shims:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/Library/Python/2.6/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/bin/erl:/usr/local/bin/elixir:$PATH
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

typeset -U PATH # Remove duplicates in $PATH
