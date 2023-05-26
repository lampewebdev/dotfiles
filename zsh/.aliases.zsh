alias l='exa -lah'
alias ls='exa -l'
alias sl='exa -l'
alias c='clear'
alias v='nvim'
alias ze='zellij'
alias zea='zellij a'
alias zel='zellij ls'
alias stowh="stow --target $HOME"
function take {
  mkdir -p $1
  cd $1
}
