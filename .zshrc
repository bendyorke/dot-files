# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="ender"

# ZSH plugins
# plugins+=(git)
plugins+=(zsh-completions)
autoload -U compinit && compinit
# autoload -Uz _git && _git

# Load rbenv if installed
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# tm command - run .tmux or succeed
export TMUX_COMMAND="'./.tmux 2>/dev/null || set exit code 0' Enter C-l"

# Set node path
export NODE_PATH="/usr/local/lib/node_modules"

# Build Path
source ~/.files/path

# Assign Aliases
source ~/.files/alias

# Declare functions
source ~/.files/functions

# Source envs
source ~/.env

# Bind asciiart to err --- requires alias for agreenturtle
# trap turtles ERR

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# NVIM
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
