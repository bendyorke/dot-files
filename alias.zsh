# Config Aliases
alias sz="source ~/.zshrc"
alias se=". ./.env"
alias vi="vim"
alias vz="vi ~/.zshrc"
alias vv="vi ~/.vimrc"
alias vb="vi +BundleInstall +qall"
alias xx="chmod +x"

# Workflow Aliases
alias t="todo --task-dir /usr/local/lib/tasks --list tasks --delete-if-empty"
alias tovim="cut -d':' -f1 |xargs vim"
alias bx="nocorrect bundle exec"
alias sweep="rm ~/.vim/swap/*"

# Git Aliases
alias aa="git add -p"
alias cc="git commit --verbose"
alias nb="git stash save && git checkout master && git pull origin master && git checkout -b"
alias lb="git branch"
alias bb="git stash save && git checkout"
alias rb="git fetch && git checkout -b"
alias ss="git status"
alias stage="git push -f staging"
alias rebase="git pull --rebase origin master"

# Directory Aliases
alias cms="cd ~/project/adclient_cms"

# Lolz Aliases
alias gains="bx thin start -p 1111"
alias gain="rails c"

# Long commands
alias hosts="dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Ascii Aliases
alias anowl="cat ~/.ascii/owl"
alias aturtle="cat ~/.ascii/turtle"
alias asquirrel="cat ~/.ascii/squirrel"
alias aredsquirrel='echo -e "\e[1;31m$(<~/.ascii/squirrel)\e[0m"'
alias agreenturtle='echo -e "\e[0;32m$(<~/.ascii/turtle)\e[0m"'
