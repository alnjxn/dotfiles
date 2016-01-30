export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alnjxn"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
# Environment Variables
export NODE_ENV=development
export NODE_HOST=localhost
export NODE_PORT=8000
export DB_DEV_USER=root
export DB_DEV_PASS=rootpass
export EDITOR="vim"
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.5.1/libexec"

# z jump fix
[[ -s $(brew --prefix)/etc/profile.d/z.sh ]] && . $(brew --prefix)/etc/profile.d/z.sh

# Brew Cask Options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# CubeSensors API Keys
export CUBE_KEY="Hdpr3oS43KjeCeUDagJl"
export CUBE_SECRET="GguXXlu6SMs1Q9BqhndXKCE3"
export CUBE_USER="daniel.davis@wework.com"
export CUBE_PASS="wework"

# zsh help
# unalias run-help
# autoload run-help
# HELPDIR=/usr/local/share/zsh/help

# Deployment Keys
export AWS_HOME=~/.aws
export DIGITAL_OCEAN_TOKEN=5e3011a7d687a667e287586e43d6a417c70ecdc3831c60a681687e8d674e74a7

# Docker Aliases
alias dm="docker-machine"
alias dml="docker-machine ls"
alias di="docker images"
alias drmi="docker rmi"
alias dcu="docker-compose up"

# Alias to neovim
alias v="nvim"

# More aliases
alias sz="source ~/.zshrc"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nenv
export PATH="$HOME/.nenv/bin:$PATH"
eval "$(nenv init -)"

# added by travis gem
[ -f /Users/a.jackson/.travis/travis.sh ] && source /Users/a.jackson/.travis/travis.sh

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export ZLE_RPROMPT_INDENT=0
export BULLETTRAIN_TIME_SHOW=false
export BULLETTRAIN_STATUS_SHOW=false
export BULLETTRAIN_PROMPT_ADD_NEWLINE=false
export DISABLE_AUTO_TITLE=true

# postgres
export PGDATA='/usr/local/var/postgres'

# aws cli
source /usr/local/share/zsh/site-functions/_aws
