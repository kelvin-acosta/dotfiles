# Setting of env variables.

export XDG_CONFIG_HOME="$HOME/.config"

# Term
export TERM=xterm-256color
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

# Editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# MacOS
OS=$(uname -o)
if [[ "$OS" = "Darwin" ]]; then
  export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
  export LDFLAGS="-L$HOMEBREW_PREFIX/opt/libffi/lib -L$HOMEBREW_PREFIX/opt/libpq/lib -L$HOMEBREW_PREFIX/opt/llvm/lib $LDFLAGS"
  export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/libffi/include -I$HOMEBREW_PREFIX/opt/libpq/include -I$HOMEBREW_PREFIX/opt/llvm/include $CPPFLAGS"
  export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/libffi/lib/pkgconfig:$HOMEBREW_PREFIX/opt/libpq/lib/pkgconfig:$PKG_CONFIG_PATH"
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
  export PATH=$HOMEBREW_PREFIX/bin:$PATH
  export PATH=/opt/homebrew/opt/libpq/bin:$PATH
  export DOCKER_DEFAULT_PLATFORM=linux/amd64
  export PATH="$HOME/.bootstrap/resources/bin:$PATH"
fi

# LS COLOR
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Path
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.krew/bin:$PATH"

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
  --color=fg+:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#9ece6a \
  --color=hl+:#bb9af7 \
  --color=hl:#bb9af7 \
  --color=info:#7aa2f7 \
  --color=marker:#9ece6a \
  --color=pointer:#7dcfff \
  --color=prompt:#7dcfff \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#9ece6a \
"

typeset -U PATH # Remove duplicates in $PATH
