# Setting and editing of env variables.

# Term
export TERM=xterm-256color
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

# Editor
export EDITOR="nvim"
export SUDO_EDITOR="nvim"

# MacOS
OS=$(uname -o)
if [ "$OS" = "Darwin" ]; then
  export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
  export LDFLAGS="-L$HOMEBREW_PREFIX/opt/libffi/lib -L/opt/homebrew/opt/libpq/lib $LDFLAGS"
  export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/libffi/include -I/opt/homebrew/opt/libpq/include $CPPFLAGS"
  export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/libffi/lib/pkgconfig:/opt/homebrew/opt/libpq/lib/pkgconfig:$PKG_CONFIG_PATH"
  export CFLAGS=-Qunused-arguments
  export CPPFLAGS=-Qunused-arguments
  export PATH=$HOMEBREW_PREFIX/bin:$PATH
  export PATH=/opt/homebrew/opt/libpq/bin:$PATH
fi

# LS COLOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Path
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.krew/bin:$PATH"

# Go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

## Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

## Ruby
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

## Node
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

typeset -U PATH # Remove duplicates in $PATH
