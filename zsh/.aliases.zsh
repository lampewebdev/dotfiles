alias l='eza -lah'
alias ls='eza -l'
alias sl='eza -l'
alias stowh="stow --target $HOME"

alias f='cd ~/code && cd $(fd --type d --hidden --exclude .git --exclude node_module --exclude .cache --exclude .npm --exclude .mozilla --exclude .meteor --exclude .nv --exclude .mvn --exclude .angular --exclude .husky --exclude .vscode --exclude changelogtest --exclude .obsidian | fzf)'

alias gaa='git add --all'
alias ggl='git pull origin'
alias gss='git status -s'
alias gfa='git fetch --all --prune'
alias glog='git log --oneline --decorate --color --graph'

function take {
  mkdir -p $1
  cd $1
}
