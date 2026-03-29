# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/michael/.zsh/completions:"* ]]; then export FPATH="/Users/michael/.zsh/completions:$FPATH"; fi



# villain helpers
export PATH="$HOME/bin:$PATH"
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

tmuxSesion () { ~/tmux-session.sh }
bindkey '^f' tmuxSesion

export EDITOR=neovim

source_if_exists $HOME/.env.sh
source_if_exists $HOME/.aliases.zsh

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
export PNPM_HOME="/Users/michael/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

plugins=()

# zoxide
eval "$(zoxide init zsh)"
# Load Angular CLI autocompletion.
autoload -Uz compinit
compinit
source <(ng completion script)

# zoxide
eval "$(zoxide init zsh)"


# go
export PATH=$PATH:$(go env GOPATH)/bin


export PATH=$PATH:~/code/learning/zig/zig/build/stage3/bin;

# ols
export PATH="$PATH:/Users/michael/code/villain/odin/ols"
PATH="/Users/lampe/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/lampe/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/lampe/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/lampe/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/lampe/perl5"; export PERL_MM_OPT;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

BAT_THEME="Catppuccin-mocha"
eval "$(starship init zsh)"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

export PATH="$HOME/.rbenv/bin:$PATH"
. "/Users/michael/.deno/env"

# villain helpers
source /Users/michael/code/villain/helpers/shell-init.sh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/michael/.lmstudio/bin"
# End of LM Studio CLI section

