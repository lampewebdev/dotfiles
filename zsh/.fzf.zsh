# Setup fzf
# ---------
FZF_PATH="$(brew --prefix)/opt/fzf/bin"
if [[ ! "$PATH" == *"$FZF_PATH"* ]]; then
  PATH="${PATH:+${PATH}:}$FZF_PATH"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
