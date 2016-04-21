#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh

    echo "Updating OSX settings"
    source ~/.dotfiles/install/osx.sh

    echo "Downloading development tools"
    source ~/.dotfiles/install/dev.sh

    echo "Installing mutt for mail"
    source ~/.dotfiles/install/mutt.sh
fi

if [ "$(uname)" == "Linux" ]; then # TODO: distinct from android
    echo "Running on Debian"

    # su
    # apt update
    # apt upgrade
    # apt install sudo
    # adduser alekspak sudo
    # exit
    # exit

    # apt install -y zsh xmonad x-window-system
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

echo "Done."
