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

# Options - `man zshoptions`
setopt PROMPTSUBST
# ===== Expansion and Globbing
# when the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them
setopt GLOB_COMPLETE
# more patterns for filename generation
setopt EXTENDED_GLOB

# ===== History
# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY
# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file
setopt EXTENDED_HISTORY
# Add commands as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY
# If the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event
setopt HIST_EXPIRE_DUPS_FIRST
# Do not enter command lines into the history list if they are duplicates of the previous event
setopt HIST_IGNORE_DUPS
# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS
# remove command lines from the history list when the first character on the line is a space
setopt HIST_IGNORE_SPACE
# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS
# remove the history (fc -l) command from the history list when invoked
setopt HIST_NO_STORE
# remove superfluous blanks from each command line being added to the history list
setopt HIST_REDUCE_BLANKS
# whenever the user enters a line with history expansion, don’t execute the line directly
setopt HIST_VERIFY
# Don't write duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS

# Set bash comments
setopt interactivecomments
