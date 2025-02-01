export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

source "$ZDOTDIR/pure.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/languages.zsh"
source "$ZDOTDIR/functions.zsh"

export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

# enable vi mode + vi mode keybinds
bindkey -v
bindkey -v '^?' backward-delete-char # Backspace text beyond just the current insert

