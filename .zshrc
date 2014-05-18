# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ender"

# Config Aliases
alias sz="source ~/.zshrc"
alias se=". ./.env"
alias vi="vim"
alias vz="vi ~/.zshrc"
alias vv="vi ~/.vimrc"
alias vb="vi +BundleInstall +qall"

# Workflow Aliases
alias tc="./.tmux.configuration"
alias rar="grep -R -H --exclude-dir={log,.git,tmp,node_modules}"
alias tovim="cut -d':' -f1 |xargs vim"
alias bx="bundle exec"
alias nb="git stash save && git checkout master && git pull origin master && git checkout -b"
alias lb="git branch"
alias bb="git stash save && git checkout"
alias rb="git fetch && git checkout -b"
alias ss="git status"
alias stage="git pushtostaging"
alias rebase="git pull --rebase origin master"
alias sweep="rm ~/.vim/swap/*"

# Directory Aliases
alias box="cd ~/blue_otter/Boxbee"
alias prog="cd ~/progress/progress-api"
alias arti="cd ~/Node/progress/node_modules/artisan-pg"
alias rab="cd ~/Node/apprabbit"
alias lbake="./node_modules/artisan-pg/bin/bake.bin.js"
alias perf="cd ~/blue_otter/HGSTTesting"
alias vanity="cd ~/Ruby/DevBootCamp/Jobs/vanity"

# Pairing Alias
alias dop="echo $PAIR_PASS | pbcopy && ssh root@$PAIR_IP"

# Long commands
alias hosts="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Ascii Aliases
alias anowl="cat ~/.ascii/owl"
alias aturtle="cat ~/.ascii/turtle"
alias asquirrel="cat ~/.ascii/squirrel"
alias aredsquirrel='echo -e "\e[1;31m$(<~/.ascii/squirrel)\e[0m"'
alias agreenturtle='echo -e "\e[0;32m$(<~/.ascii/turtle)\e[0m"'
# Bind asciiart to err
trap agreenturtle ERR

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
source /etc/environment

eval "$(rbenv init -)"

