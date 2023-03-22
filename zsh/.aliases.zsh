alias l='exa -lah'
alias ls='exa -l'
alias sl='exa -l'
alias c='clear'
alias v='nvim'
alias stowh="stow --target $HOME"
function take {
  mkdir -p $1
  cd $1
}
