# Powerlevel10k prompt segments for mise
# [Feature request: add segment for mise](https://github.com/romkatv/powerlevel10k/issues/2212)
# Usage in ~/.zshrc:
#   [[ -f ~/.config/shell/p10k.mise.zsh ]] && source ~/.config/shell/p10k.mise.zsh

() {
  function prompt_mise() {
    local plugins=("${(@f)$(mise ls --current 2>/dev/null | awk '!/\(symlink\)/ && $3!="~/.tool-versions" && $3!="~/.config/mise/config.toml" {print $1, $2}')}")
    local plugin
    for plugin in ${(k)plugins}; do
      local parts=("${(@s/ /)plugin}")
      local tool=${(U)parts[1]}
      local version=${parts[2]}
      p10k segment -r -i "${tool}_ICON" -s $tool -t "$version"
    done
  }

  # Colors
  typeset -g POWERLEVEL9K_MISE_BACKGROUND=
  typeset -g POWERLEVEL9K_MISE_FOREGROUND=6

  typeset -g POWERLEVEL9K_MISE_DOTNET_CORE_FOREGROUND=5
  typeset -g POWERLEVEL9K_MISE_ELIXIR_FOREGROUND=5
  typeset -g POWERLEVEL9K_MISE_ERLANG_FOREGROUND=1
  typeset -g POWERLEVEL9K_MISE_FLUTTER_FOREGROUND=4
  typeset -g POWERLEVEL9K_MISE_GOLANG_FOREGROUND=4
  typeset -g POWERLEVEL9K_MISE_HASKELL_FOREGROUND=5
  typeset -g POWERLEVEL9K_MISE_JAVA_FOREGROUND=7
  typeset -g POWERLEVEL9K_MISE_JULIA_FOREGROUND=2
  typeset -g POWERLEVEL9K_MISE_LUA_FOREGROUND=4
  typeset -g POWERLEVEL9K_MISE_NODEJS_FOREGROUND=2
  typeset -g POWERLEVEL9K_MISE_PERL_FOREGROUND=4
  typeset -g POWERLEVEL9K_MISE_PHP_FOREGROUND=5
  typeset -g POWERLEVEL9K_MISE_POSTGRES_FOREGROUND=6
  typeset -g POWERLEVEL9K_MISE_PYTHON_FOREGROUND=3
  typeset -g POWERLEVEL9K_MISE_RUBY_FOREGROUND=1
  typeset -g POWERLEVEL9K_MISE_RUST_FOREGROUND=208
  typeset -g POWERLEVEL9K_MISE_TERRAFORM_FOREGROUND=5
  typeset -g POWERLEVEL9K_MISE_TERRAFORM_ICON='\ue69a'

  # Substitute the default asdf prompt element
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=("${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[@]/asdf/mise}")
}
