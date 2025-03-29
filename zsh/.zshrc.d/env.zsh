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
  --border=none \
"

local color00='#1d2021'
local color01='#3c3836'
local color04='#bdae93'
local color06='#ebdbb2'
local color0A='#fabd2f'
local color0C='#8ec07c'
local color0D='#83a598'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
