source ~/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle z
antigen bundle node
antigen bundle npm
antigen bundle brew
antigen bundle tmux


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Source all the configs
source ~/.zsh/aliases.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/config.zsh
