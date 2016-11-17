#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
cd ~/.dotfiles
git submodule update --init --recursive

source ~/.dotfiles/install/functions.sh
source ~/.dotfiles/install/link.sh

echo "creating temp vim directory"
mkdir -p ~/.vim-tmp

if [ "$( os_name )" == "OSX" ]
then
    echo "Running on OSX"

    prepare_osx

    echo "Brewing all the things"
    source ~/.dotfiles/install/brew.sh

    echo "Updating OSX settings"
    source ~/.dotfiles/install/osx.sh

    echo "Downloading development tools"
    source ~/.dotfiles/install/dev.sh

    echo "Installing mutt for mail"
    source ~/.dotfiles/install/mutt.sh

    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

echo "Done."
