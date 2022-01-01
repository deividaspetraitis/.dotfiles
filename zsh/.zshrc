# ---------------------------------------------
# Plugins
# ---------------------------------------------

# zplug configuration 
# Above p10k since plugins may perform console I/O after the instant prompt preamble
[ -f ~/.config/zsh/.zplugrc ] && source ~/.config/zsh/.zplugrc

# ------------------------------------------------------------------------------------------
# Put things above p10k that may perform console I/O after the instant prompt preamble
# ------------------------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Options
# More options: https://zsh.sourceforge.io/Doc/Release/Options.html
setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Navigate menu using hklj
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -U compinit; compinit;

# Directory external contains external scripts 
fpath=($ZDOTDIR/external $fpath)

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/.dotfiles/zsh/external/completion.zsh

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Enable Vi mode
bindkey -v
export KEYTIMEOUT=1 # timeout for switching between INSERT/NORMAL modes

# Enable CTRL-P CTRL-N
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Vi cursor for insert/visual modes
autoload -Uz cursor_mode && cursor_mode

# Edit command line in Vim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# 
source ~/.dotfiles/zsh/external/bd.zsh

# autocomplete-sucks mode
# tweak or remove useless thing!
if [ $(command -v "fzf") ]; then
	source /usr/share/fzf/completion.zsh
	source /usr/share/fzf/key-bindings.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Attach to or start a new tmux session
if pgrep i3 > /dev/null 2>&1 && [[ -z "$TMUX" ]]; then
	tmux attach || tmux new-session
fi
