export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alnjxn"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting node npm brew pip python tmux yarn aws)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Environment Variables
export NODE_ENV=development
export EDITOR="nvim"
export VISUAL=$EDITOR
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.7.5.1/libexec"
export AWS_HOME=~/.aws
export BLUEBIRD_DEBUG=0

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
# alias pg="postgres -D /usr/local/var/postgres"
alias pg="postgres -D /usr/local/var/postgresql@9.6"
# alias pg="pg_ctl -D /usr/local/var/postgresql@9.6 start"
alias redis="redis-server /usr/local/etc/redis.conf"
alias mdb="mongod --config /usr/local/etc/mongod.conf"
alias cl="clear"
alias jn="jupyter notebook"

## dokku
alias dokku='bash $HOME/.dokku/contrib/dokku_client.sh'
export DOKKU_HOST="dokku.wework.local"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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

# postgres
export PGDATA='/usr/local/var/postgres'
# aws cli
source /usr/local/share/zsh/site-functions/_aws
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh-autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'
# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/ajackson/.nodenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/ajackson/.nodenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/ajackson/.nodenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/ajackson/.nodenv/versions/6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# postgres 9.6
export PATH=$PATH:/usr/local/opt/postgresql@9.6/bin:$PATH

# BasicTeX
export PATH=$PATH:/usr/local/texlive/2017basic/bin/x86_64-darwin

# GoLang
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$(go env GOPATH)/bin

ulimit -n 2048

# AWS SAML
alias get-aws-credentials='f(){ cmd="docker run -it --rm -v ~/.aws:/package/.aws onelogin-aws-saml sh -c \"python /package/samlapi.py "$@"\""; bash -c "${cmd}" unset -f f; }; f'

# Balena Certs
export NODE_EXTRA_CA_CERTS=~/.open-balena/ca.crt
