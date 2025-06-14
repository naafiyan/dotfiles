os_type=$(uname -s)

arch_type=$(uname -m)
# Darwin is MacOS
if [[ "$os_type" == "Darwin" ]]; then
	export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
	export PATH="/opt/homebrew/bin:$PATH"
	export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
fi

if [ -n "$SSH_CONNECTION" ]; then
    export IS_REMOTE=1
else
    export IS_REMOTE=0
fi

# If cli_bin exists, add it to path
export PATH="$HOME/cli_bin:$PATH"
export PATH="$PATH:/home/ubuntu/.local/bin"

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
KEYTIMEOUT=1

source "$ZDOTDIR/plugins.zsh"

# Created by `pipx` on 2025-03-24 17:22:06
export PATH="$PATH:/home/ubuntu/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

