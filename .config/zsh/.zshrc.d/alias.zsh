#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

# -----------------------------
# CONFIG
# -----------------------------

alias sshconfig="vim ~/.ssh/config"

# -----------------------------
# MAKE TERMINAL BETTER
# -----------------------------

alias src='cd ~/src'
alias be='bundle exec'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}' # grep: excluse certain dirs

# -------------------------------
# FILE AND FOLDER MANAGEMENT
# -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

# extract:  Extract most know archives with one command
# ---------------------------------------------------------
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


# ---------------------------
# SEARCHING
# ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
# ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# memHogsTop, memHogsPs:  Find memory hogs
# -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# cpuHogs:  Find CPU hogs
# -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

# my_ps: List processes owned by my user:
# ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

# ---------------------------
# NETWORKING
# ---------------------------

alias myip='curl ipecho.net/plain ; echo'           # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

# ---------------------------
# GIT
# ---------------------------

alias g='git'
alias ga='git add'
alias gbdme='git branch | grep 'kelvin' | xargs git branch -D'
alias gb='git branch'
alias gbl='git blame -w'
alias gclean='git clean --interactive -d'
alias gcmsg='git commit --message'
alias gco='git checkout'
alias gcshort='git rev-parse --short HEAD'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gfa='git fetch --all --tags --prune --jobs=10'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpristine='git reset --hard && git clean --force -dfx'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gsh='git show'
alias gss='git status --short'
alias gst='git status'
alias gsw='git switch'
alias gswc='git switch --create'
alias ghpr='gh pr create'
alias zshTime='for i in $(seq 1 10); do time zsh -i -c exit; done'

# ---------------------------
# AWS
# ---------------------------
awspe() {
  local credentials
  credentials=$(aws configure export-credentials --profile "$AWS_PROFILE" --format env)
  source <(echo $credentials)
}

assume_role() {
  if [ -z "$1" ]; then
    echo "Usage: assume_role <role-arn> [session-name]"
    return 1
  fi

  ROLE_ARN="$1"
  SESSION_NAME="${2:-kelvin}"

  CREDS=$(aws sts assume-role \
    --role-arn "$ROLE_ARN" \
    --role-session-name "$SESSION_NAME" \
    --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
    --output text)

  if [ $? -ne 0 ]; then
    echo "Failed to assume role"
    return 1
  fi

  export AWS_ACCESS_KEY_ID=$(echo "$CREDS" | awk '{print $1}')
  export AWS_SECRET_ACCESS_KEY=$(echo "$CREDS" | awk '{print $2}')
  export AWS_SESSION_TOKEN=$(echo "$CREDS" | awk '{print $3}')

  echo "Assumed role: $ROLE_ARN"
}

alias awsc='env | grep -i AWS'
alias awsp='export AWS_PROFILE=$(awk '\''/^\[profile/ { sub(/\]$/, "", $2); print $2 }'\'' "${HOME}/.aws/config" | fzf --prompt="Select profile: " --height=50% --reverse) && printf "Set profile to \033[1;33m$AWS_PROFILE\n"'

# ---------------------------
# OTHER
# ---------------------------
alias k='kubectl'
alias antipurge='rm -rf `antidote home` && rm $HOME/.zsh_plugins.zsh'
alias assh="aws ssm start-session --target"
alias vim="nvim"
alias k9s="TERM=xterm-256color k9s"

if [[ $OSTYPE = darwin* ]]; then
  alias mycoach="BUNDLE_GEMFILE=$HOME/src/coach/coach_cli/Gemfile bundle exec $HOME/src/coach/coach_cli/exe/coach"
fi
