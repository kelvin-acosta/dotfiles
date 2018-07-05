# Completions
autoload -Uz compinit && compinit
# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# History
HISTSIZE=10000 # Lines of history to keep in memory for current session
HISTFILESIZE=10000 # Number of commands to save in the file
SAVEHIST=10000 # Number of history entries to save to disk
HISTFILE=~/.zsh_history # Where to save history to disk
HISTDUP=erase # Erase duplicates in the history file
setopt hist_ignore_dups # Ignore duplicates
setopt hist_reduce_blanks
setopt hist_save_no_dups

# Options - `man zshoptions`
setopt append_history # Append history to the history file (no overwriting)
setopt share_history # Share history across terminals
setopt inc_append_history # Immediately append to the history file, not just when a term is killed
setopt extended_glob # Use extended globbing syntax

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # FZF fuzzy search
