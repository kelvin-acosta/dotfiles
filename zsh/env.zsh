# Setting and editing of env variables.

eval "$(/opt/homebrew/bin/brew shellenv)"

# TERM
export TERM="xterm-256color"

# VARS
export EDITOR="vim"
export SUDO_EDITOR="vim"
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/libffi/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/libffi/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/libffi/lib/pkgconfig"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# LS COLOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# PATH
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH
export PATH=$HOMEBREW_PREFIX/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## PYTHON PATHS
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

export SDM_EMAIL="kelvin.acosta@betterment.com"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

typeset -U PATH # Remove duplicates in $PATH
