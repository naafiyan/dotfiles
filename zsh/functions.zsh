# Emit OSC52 to copy stdin to system clipboard.
# Your terminal ($TERM) needs to support OSC52.
# If using tmux, you may need to set -g set-clipboard on
xp() { 
	printf '\033]52;c;%s\a' "$(base64 | tr -d '\n')"; 
}

# Start alacritty with diff theme for remote.
assh() {
	alacritty --config-file "~/dotfiles/alacritty/remote.toml" -e ssh $1 & disown
}
