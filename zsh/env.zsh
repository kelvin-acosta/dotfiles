# Setting and editing of env variables.

# Term
export TERM=xterm-256color
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

# Editor
export EDITOR="nvim"
export SUDO_EDITOR="nvim"

# MacOS
OS=$(uname -o)
if [[ "$OS" = "Darwin" ]]; then
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

## Rust
export PATH="$HOME/.cargo/bin:$PATH"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

typeset -U PATH # Remove duplicates in $PATH
