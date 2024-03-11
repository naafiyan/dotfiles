#! /bin/sh
unamestr=$(uname)
if [[ "$unamestr" != 'Linux' ]]; then
	echo "Script only works for Linux"
	exit 0
fi

sudo apt-get update &&
sudo apt-get install ninja-build gettext cmake unzip curl git &&
git clone https://github.com/neovim/neovim &&
cd neovim && make CMAKE_BUILD_TYPE=Release &&
sudo make install
