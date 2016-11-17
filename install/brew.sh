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

# Dekstop
get_desktop mattr-slate

# Font setup
get_desktop caskroom/fonts/font-hack

cd ~/Library/Fonts
if [ ! -e "Droid Sans Mono for Powerline Nerd Font Complete.otf" ]
then
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
fi

