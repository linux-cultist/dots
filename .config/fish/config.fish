if status is-interactive
    # Commands to run in interactive sessions can go here
    # alias gitconfig="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

    alias ll="exa -l --icons -snew"
    alias gs="git status"
    alias v="nvim"
    alias vim=v
    alias c="chezmoi"
    alias t="tmux"
    alias ta="t a -t"
    alias tls="t ls"
    alias tn="t new -t"
    # alias gitconfig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	source ~/.config/fish/functions/dots.fish
    
	set fish_greeting
    set -g fish_autosuggestion_enabled 0

    set -gx DEBUGINFOD_URLS https://debuginfod.archlinux.org/
    set -gx XDG_CONFIG_DIR $HOME/.config
    set -gx EDITOR nvim

    fish_add_path /home/cado/.cargo/bin

    # fzf_configure_bindings --variables=

    starship init fish | source
end
