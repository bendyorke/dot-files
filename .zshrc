# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="ender"

# ZSH plugins
plugins=(git)

# Load rbenv if installed
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# tm command - run .tmux or succeed
export TMUX_COMMAND="'./.tmux 2>/dev/null || set exit code 0' Enter C-l"

# Build Path
source ~/.files/path.zsh

# Assign Aliases
source ~/.files/alias.zsh

# Declare functions
source ~/.files/function.zsh

# Bind asciiart to err --- requires alias for agreenturtle
trap agreenturtle ERR

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

