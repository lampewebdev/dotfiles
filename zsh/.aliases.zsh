alias l='exa -lah'
alias ls='exa -l'
alias sl='exa -l'
alias c='clear'
alias v='nvim'
alias ze='zellij'
alias zea='zellij a'
alias zel='zellij ls'
alias stowh="stow --target $HOME"

alias gaa='git add --all'
alias ggl='git pull origin'
alias gss='git status -s'
alias gfa='git fetch --all --prune'
alias glog='git log --oneline --decorate --color --graph'

function take {
  mkdir -p $1
  cd $1
}
