alias l='eza -lah'
alias ls='eza -l'
alias sl='eza -l'
alias c='clear'
alias v='nvim'
alias ze='zellij'
alias zea='zellij a'
alias zel='zellij ls'
alias zes='zellij -s'
alias stowh="stow --target $HOME"

# alias zig="/Users/mlape6/code/learning/zig/zig/build/stage3/bin/zig"

alias gaa='git add --all'
alias ggl='git pull origin'
alias gss='git status -s'
alias gfa='git fetch --all --prune'
alias glog='git log --oneline --decorate --color --graph'

function take {
  mkdir -p $1
  cd $1
}
