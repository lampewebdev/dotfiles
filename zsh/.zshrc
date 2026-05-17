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

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

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


# Load Angular CLI autocompletion.
source <(ng completion script)

# Vite+ bin (https://viteplus.dev)
. "$HOME/.vite-plus/env"
