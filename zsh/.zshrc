# This sets the environment for interactive shells.
# This gets loaded after .zprofile.
# It's typically a place where you "set it and forget it" type of parameters like $PATH, $PROMPT, aliases, and functions you would like to have in both login and interactive shells.
#
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

# Directory external contains external scripts 
fpath=($ZDOTDIR/external $fpath)

# Enable Vi mode
bindkey -v
bindkey "^?" backward-delete-char # Fix modes N -> I -> I backspace  not working

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

# Disable first autocompletion on TAB 
setopt noautomenu

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# OS specific settings
case "$OSTYPE" in
  darwin*)  source ~/.config/zsh/.zshrc-macos ;; 
  linux*)   source ~/.config/zsh/.zshrc-linux ;;
  *)        echo ".zshrc unknown OS: $OSTYPE" ;;
esac
