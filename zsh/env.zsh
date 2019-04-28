# Setting and editing of env variables.

# VARS
export EDITOR='vim'
export SUDO_EDITOR='vim'
export DOTFILES="$HOME/.dotfiles"

# LS COLOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/bin/erl:/usr/local/bin/elixir:$PATH"
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"
eval "$(jenv init -)"

typeset -U PATH # Remove duplicates in $PATH
