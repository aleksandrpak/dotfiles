#!/bin/sh

apt update
apt install man
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

pip install neovim

