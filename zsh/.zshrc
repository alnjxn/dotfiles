# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- FZF ----
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ---- HISTORY ----
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# ---- BINDINGS ----
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- ZOXIDE ----
eval "$(zoxide init zsh)"

# ---- NODENV ----
eval "$(nodenv init - zsh)"

# ---- EXPORTS ----
export NODE_ENV=development
export EDITOR="nvim"
export VISUAL=$EDITOR
# ag default source for fzf
export FZF_DEFAULT_COMMAND='ag -l --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export ZLE_RPROMPT_INDENT=0
export BULLETTRAIN_TIME_SHOW=false
export BULLETTRAIN_STATUS_SHOW=false
export BULLETTRAIN_PROMPT_ADD_NEWLINE=false
export DISABLE_AUTO_TITLE=true

# ---- ZSH STYLE ----
# highlight zsh menu selection
zstyle ':completion:*' menu select

# ---- ALIASES ----
alias v="vim"
alias n="nvim"
alias s="kitten ssh"
alias switch="darwin-rebuild switch --flake ~/.config/nix#macbook-air"
alias sz="source ~/.zshrc"
alias cl="clear"
# docker commands
alias dm="docker-machine"
alias dml="docker-machine ls"
alias di="docker images"
alias drmi="docker rmi"
alias dcu="docker-compose up"
# git commands
alias gs="git status"
alias gc="git commit"
# replace cd with Zoxide
alias cd="z"
# replace ls with Eza
alias ls="eza --icons=always --oneline"
alias lsa="eza --icons=always --oneline --long --all"
