# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "mafredri/zsh-async", from:github, defer:0
zplug "Tarrasch/zsh-bd"
zplug "junegunn/fzf"
zplug "lib/completion", from:oh-my-zsh
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
