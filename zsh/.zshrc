export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

source "$ZDOTDIR/pure.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/languages.zsh"

export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

# enable vim mode
bindkey -v
