#!/bin/sh

echo "Installing homebrew packages..."

# # CLI
get reattach-to-user-namespace
get tree
get ag
get wget
get zsh
get tmux
get zsh-syntax-highlighting

# Development
get neovim/neovim/neovim

# Font setup
get_desktop caskroom/fonts/font-hack
get_desktop font-droid-sans-mono-for-powerline
