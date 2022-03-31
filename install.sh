#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
cd ~/.dotfiles
git submodule update --init --recursive

source ~/.dotfiles/install/functions.sh
source ~/.dotfiles/install/link.sh

echo "creating temp vim directory"
mkdir -p ~/.tmp

if [ "$( uname )" == "Darwin" ]
then
    echo "Running on OSX"

    prepare_osx

    echo "Brewing all the things"
    source ~/.dotfiles/install/brew.sh

    echo "Updating OSX settings"
    source ~/.dotfiles/install/osx.sh

    echo "Downloading development tools"
    source ~/.dotfiles/install/dev.sh

    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

if [ "$( uname )" == "Linux" ]
then
  echo "Running on Linux"

  source ~/.dotfiles/install/google.sh
fi

echo "Done."
