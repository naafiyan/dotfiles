# better cd
eval "$(zoxide init zsh)"

# epic plugin
eval $(thefuck --alias)

# zsh-autosuggestions installed using homebrew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting (installed using homebrew)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
