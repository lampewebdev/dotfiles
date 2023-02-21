
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

export HOMEBREW_NO_ANALYTICS=1

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"

#history up
bindkey "$terminfo[kcuu1]" history-substring-search-up
#history down
bindkey "$terminfo[kcud1]" history-substring-search-down

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Load Angular CLI autocompletion.
autoload -Uz compinit
compinit
source <(ng completion script)
