# Setting and editing of env variables.

# TERM
export TERM="xterm-256color"

# VARS
export EDITOR='vim'
export SUDO_EDITOR='vim'
export DOTFILES="$HOME/.dotfiles"
export LDFLAGS="-L/usr/local/opt/testtrack/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# LS COLOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# PATH
export ANDROID_HOME="$HOME/Library/Android/sdk"
export GOPATH="$HOME/.go"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/bin/erl:/usr/local/bin/elixir:$PATH"
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH="$GOPATH/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

typeset -U PATH # Remove duplicates in $PATH
