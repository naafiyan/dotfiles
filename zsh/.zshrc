export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

source "$ZDOTDIR/pure.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/plugins.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/naafiyanahmed/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/naafiyanahmed/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/naafiyanahmed/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/naafiyanahmed/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"

# alias ls="lsd"

# bun completions
[ -s "/Users/naafiyanahmed/.bun/_bun" ] && source "/Users/naafiyanahmed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# enable vim mode
bindkey -v
