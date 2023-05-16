#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll="exa -l --icons -snew"
alias gs="git status"
alias v="nvim"
alias vim=v
alias dots="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# PS1='[\u@\h \W]\$ '
# . "$HOME/.cargo/env"

export DEBUGINFOD_URLS=https://debuginfod.archlinux.org/
export XDG_CONFIG_DIR=$HOME/.config
export EDITOR=nvim
# export PATH=~/.local/bin:~/.cargo/bin:$PATH
export HISTSIZE=10000
export HISTFILESIZE=10000

# export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_DEFAULT_OPTS=''
source /usr/share/fzf/key-bindings.bash 			# Fzf completions
source /usr/share/fzf/completion.bash				# Fzf completions
# source ~/Temp/base16-fzf/bash/base16-dracula.config # Fzf theming

shopt -s histappend
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Remap CTRL-T to CTRL-X CTRL-T
bind -x '"\C-f": fzf-file-widget'
# bind '"\C-f": transpose-chars'

eval "$(starship init bash)"
