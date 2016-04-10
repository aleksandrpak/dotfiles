#!/bin/sh

apt update
apt install man
apt install coreutils
apt install gcc
apt install cmake
apt install python
apt install python-dev
apt install zsh
apt install nvim
apt install tmux

chsh -s zsh

# linking
# fix /usr/bin/python in YouCompleteMe
# ssha to launch ssh-agent
# add key to github
# move thefuck to separate .zshrc

pip install neovim

