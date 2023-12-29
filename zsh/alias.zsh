# Compilation flags
# export ARCHFLAGS="-arch x86_64"
alias myfuse='sshfs nahmed21@ssh.cs.brown.edu:/gpfs/main/home/nahmed21 ~/browncs && cd ~/browncs'
alias fixfuse='diskutil unmount force ~/browncs && myfuse'
# alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias funmount="diskutil unmount force browncs"
# alias mca="make clean all"
# alias cs15fuse="sshfs -o defer_permissions nahmed21@ssh.cs.brown.edu:/course/cs0150 /Users/naafiyanahmed/CS15Fuse"
# alias funmount15="diskutil unmount force CS15Fuse"

#alias python='/usr/bin/python3'
alias pip='/usr/bin/pip3'

alias bssh="ssh nahmed21@ssh.cs.brown.edu"
alias bsshy="ssh nahmed21@ssh.cs.brown.edu -Y"

alias ls="ls --color"
alias python=$(which python3.11)
alias fzo='open "$(fzf)"'
