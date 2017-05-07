export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alnjxn"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Environment Variables
export NODE_ENV=development
export EDITOR="nvim"
export VISUAL=$EDITOR
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.5.1/libexec"
export AWS_HOME=~/.aws
export BLUEBIRD_DEBUG=0

# FZF Settings
# export FZF_DEFAULT_OPTS='
#   --color fg:188,bg+:66,hl:174,hl+:174
#   --color spinner:186,pointer:16,info:104'

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
alias pg="postgres -D /usr/local/var/postgres"
alias cl="clear"

# dokku
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
export DOKKU_HOST="dokku.wework.local"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# esp32
# export PATH=$PATH:$HOME/.esp/xtensa-esp32-elf/bin

# pandoc completions
eval "$(pandoc --bash-completion)"

#yarn
export PATH="$PATH:`yarn global bin`"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'
