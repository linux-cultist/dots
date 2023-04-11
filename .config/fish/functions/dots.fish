function dots -w git -d "Manages dotfiles"
    git --git-dir=$HOME/.cfg --work-tree=$HOME $argv
end
