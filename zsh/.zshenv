# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Dotfiles path
export DOTDIR="$HOME/.dotfiles"

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# For Zsh config files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History filepath
export HISTFILE="$HOME/.zsh_history"

# Maximum history events for internal history
export HISTSIZE=100000

# Maximum history events for history file 
export SAVEHIST=100000

# Aliases
source "$ZDOTDIR/.zsh_aliases"

# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Machine specific aliases and/or containing sensitive information
if [ -f "$HOME/.zsh_aliases" ]; then
	source "$HOME/.zsh_aliases"
fi

# Custom gpg cache
. "$ZDOTDIR/external/gpg_cache.zsh"

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin

export SSH_AUTH_SOCK="~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Autocompletion
autoload -U compinit; compinit -d "$XDG_CACH_HOME/zsh/.zcompdump";

# Autocomplete hidden files
_comp_options+=(globdots)
