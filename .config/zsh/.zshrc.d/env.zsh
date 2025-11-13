# Editor
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export GIT_EDITOR="$EDITOR"

# MacOS
if [[ $OSTYPE = darwin* ]]; then
  # podman machine set --rootful
  # podman machine inspect | yq ".[0].ConnectionInfo.PodmanSocket.Path"
  export DOCKER_HOST='unix:///var/folders/87/rmn0qkj92hz499h0n4pwx9tm0000gp/T/podman/podman-machine-default-api.sock'
fi

export KUBECTX_CURRENT_FGCOLOR=$(printf "\e[38;2;167;192;128m")
export KUBECTX_CURRENT_BGCOLOR=$(printf "\033[38;2;45;53;59m")

export PATH="$HOME/.local/bin:$PATH"

# Krew
export PATH="$HOME/.krew/bin:$PATH"

## Rust
export PATH="$HOME/.cargo/bin:$PATH"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --info=inline-right \
  --layout=reverse \
"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:#9da9a9,bg:-1,bg+:#272e33
  --color=hl:#7fbbb3,hl+:#83c092,info:#a7c080,marker:#a7c080
  --color=prompt:#e67e80,spinner:#d699b6,pointer:#d699b6,header:#87afaf
  --color=selected-bg:#4c3743
  --border="rounded" --preview-window="border-rounded"
  --pointer="◆"'
