export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alnjxn"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Environment Variables
export NODE_ENV=development
export EDITOR="vim"
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.5.1/libexec"
export AWS_HOME=~/.aws

# z jump fix
[[ -s $(brew --prefix)/etc/profile.d/z.sh ]] && . $(brew --prefix)/etc/profile.d/z.sh

# Brew Cask Options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Aliases
alias dm="docker-machine"
alias dml="docker-machine ls"
alias di="docker images"
alias drmi="docker rmi"
alias dcu="docker-compose up"
alias v="vim"
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
