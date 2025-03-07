os_type=$(uname -s)

arch_type=$(uname -m)
# Darwin is MacOS
if [[ "$os_type" == "Darwin" ]]; then
	export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
	export PATH="/opt/homebrew/bin:$PATH"
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
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

# Enable shared history between zsh sessions without dups or spaces.
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

source "$ZDOTDIR/plugins.zsh"
