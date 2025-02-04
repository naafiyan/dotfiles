# Check if mac
if [[ "$(uname)" == "Darwin" ]]; then
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
	export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
	export PATH="/opt/homebrew/bin:$PATH"
fi

# If cli_bin exists, add it to path
export PATH="$HOME/cli_bin:$PATH"

source "$ZDOTDIR/pure.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/languages.zsh"
source "$ZDOTDIR/functions.zsh"

# enable vi mode + vi mode keybinds
bindkey -v
bindkey -v '^?' backward-delete-char # Backspace text beyond just the current insert

source "$ZDOTDIR/plugins.zsh"
