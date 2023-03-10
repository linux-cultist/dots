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
alias c="chezmoi"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias sudo="sudo "
alias gitconfig="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

PS1='[\u@\h \W]\$ '
# . "$HOME/.cargo/env"

export OPENAI_API_KEY=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
export DEBUGINFOD_URLS=https://debuginfod.archlinux.org/
export XDG_CONFIG_DIR=$HOME/.config
export EDITOR=nvim
export PATH=~/.local/bin:~/.cargo/bin:$PATH
export HISTSIZE=10000
export HISTFILESIZE=10000


source /usr/share/fzf/key-bindings.bash 			# Fzf completions
source /usr/share/fzf/completion.bash				# Fzf completions
source ~/Temp/base16-fzf/bash/base16-dracula.config # Fzf theming

shopt -s histappend
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

eval "$(starship init bash)"
