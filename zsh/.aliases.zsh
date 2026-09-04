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

dib-dev() {
  local dir
  dir=$(cd "${1:-$HOME/code/work/customer-portal/DT-19415-gbv-from-rebase}" && pwd)

  echo "pnpm i in $dir..."
  (cd "$dir" && pnpm i) || return 1

  local pane1 pane2
  pane1=$(wezterm cli spawn --new-window --cwd "$dir" -- zsh -lic 'pnpm start:host')
  [[ -z "$pane1" ]] && { echo "failed to spawn pane 1"; return 1 }

  pane2=$(wezterm cli split-pane --pane-id "$pane1" --percent 50 --right --cwd "$dir" -- zsh -lic 'pnpm watch:packages')
  wezterm cli split-pane --pane-id "$pane2" --percent 50 --bottom --cwd "$dir" -- zsh -lic 'pnpm start:remote'
}
