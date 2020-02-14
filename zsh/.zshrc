export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting node npm brew tmux)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Environment Variables
export NODE_ENV=development
export EDITOR="nvim"
export VISUAL=$EDITOR

# Brew Cask Options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Aliases
alias dm="docker-machine"
alias dml="docker-machine ls"
alias di="docker images"
alias drmi="docker rmi"
alias dcu="docker-compose up"
alias v="vim"
alias n="nvim"
alias sz="source ~/.zshrc"
alias cl="clear"

# nodenv
eval "$(nodenv init -)"

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export ZLE_RPROMPT_INDENT=0
export BULLETTRAIN_TIME_SHOW=false
export BULLETTRAIN_STATUS_SHOW=false
export BULLETTRAIN_PROMPT_ADD_NEWLINE=false
export DISABLE_AUTO_TITLE=true

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh-autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'

ulimit -n 2048
