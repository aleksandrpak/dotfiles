#!/bin/sh

echo "Installing homebrew packages..."

# # CLI
get tree
get ag
get wget
get zsh
get tmux
get zsh-syntax-highlighting
get svn

# Development
get vim

# Font setup
get_desktop homebrew/cask-fonts/font-hack
get_desktop font-droid-sans-mono-for-powerline
