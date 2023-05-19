
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

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
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# zoxide
eval "$(zoxide init zsh)"
unalias z
function z () {
    __zoxide_z "$@"
}
# Load Angular CLI autocompletion.
autoload -Uz compinit
compinit
source <(ng completion script)

PATH="/Users/lampe/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/lampe/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/lampe/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/lampe/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/lampe/perl5"; export PERL_MM_OPT;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.config/broot/launcher/bash/br
