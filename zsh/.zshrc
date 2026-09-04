source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# Lazy-loaded from .profile
eval "$(/opt/homebrew/bin/brew shellenv)"
source_if_exists "$HOME/.cargo/env"

# OrbStack
source_if_exists "$HOME/.orbstack/shell/init.zsh"

# pipx
export PATH="$PATH:$HOME/.local/bin"

# Add deno completions to search path
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then export FPATH="$HOME/.zsh/completions:$FPATH"; fi


export EDITOR=neovim

source_if_exists "$HOME/.env.sh"
source_if_exists "$HOME/.aliases.zsh"

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

export HOMEBREW_NO_ANALYTICS=1

# PATH exports
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Users/michael/.usagi/bin:$PATH"

# pnpm
# Two directories matter: $PNPM_HOME/bin holds pnpm 11+ and its own shims,
# while $PNPM_HOME itself still holds globals installed before that move.
# Dropping either one silently loses commands.
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH" ;;
esac

# Node managed by pnpm. Globbed rather than version-pinned, so a `pnpm env use`
# does not silently strip node from PATH. (N) is nullglob: no match, no error.
for _pnpm_node in "$PNPM_HOME"/nodejs/*/bin(N); do
  export PATH="$PATH:$_pnpm_node"
done
unset _pnpm_node

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# history substring search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# fzf
source_if_exists ~/.fzf.zsh

export BAT_THEME="Catppuccin-mocha"

# ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

source_if_exists "$HOME/.deno/env"
source_if_exists "$HOME/code/villain/helpers/shell-init.sh"




# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/michael/.lmstudio/bin"
# End of LM Studio CLI section



# Added by Antigravity CLI installer
export PATH="/Users/michael/.local/bin:$PATH"
