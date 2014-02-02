# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Config Aliases
alias sz="source ~/.zshrc"
alias vi="vim"
alias vz="vi ~/.zshrc"
alias vv="vi ~/.vimrc"

# Workflow Aliases
alias bx="bundle exec"
alias nb="git stash save && git checkout master && git pull origin master && git checkout -b"
alias lb="git branch"
alias bb="git stash save && git checkout"
alias rb="git fetch && git checkout -b"
alias ss="git status"
alias stage="git pushtostaging"
alias rebase="git pull --rebase origin master"

# Pairing Alias
alias dop="echo $PAIR_PASS | pbcopy && ssh root@$PAIR_IP"

# Ascii Aliases
alias anowl="cat ~/.ascii/owl"
alias aturtle="cat ~/.ascii/turtle"
alias asquirrel="cat ~/.ascii/squirrel"
alias aredsquirrel='echo -e "\e[1;31m$(<~/.ascii/squirrel)\e[0m"'
alias agreenturtle='echo -e "\e[1;32m$(<~/.ascii/turtle)\e[0m"'
# Bind asciiart to err
trap agreenturtle ERR

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
source /etc/environment
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Init rbenv
eval "$(rbenv init -)"
