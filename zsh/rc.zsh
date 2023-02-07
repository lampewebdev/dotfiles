
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/aliases.zsh

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# Tell Antigen that you're done.
antidote load

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/lampe/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Load Angular CLI autocompletion.
autoload -Uz compinit
compinit
source <(ng completion script)