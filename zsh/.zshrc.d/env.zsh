# Editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"

# MacOS
if [[ $OSTYPE = darwin* ]]; then
  export DOCKER_HOST="unix://$HOME/.config/colima/docker.sock"
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
