#!/bin/bash

# Print all commands except echo
set -x
exec 2> >(grep -v '^\+ echo')

echo "Installing dotfiles"

echo "Initializing submodule(s)"
cd ~/.dotfiles
git submodule update --init --recursive

source ~/.dotfiles/install/link.sh

echo "Creating temp vim directory"
mkdir -p ~/.tmp

echo "Creating Go projects directory"
mkdir -p ~/Projects/gocode

echo "Creating ZSH cache directory"
mkdir -p ~/.zsh/cache

if [ "$(uname)" == "Darwin" ]; then
  echo "Running on OSX"

  echo "Installing Nix"
  source ~/.dotfiles/install/nix.sh

  echo "Configuring zsh as default shell"
  chsh -s $(which zsh)
fi

if [ "$(uname)" == "Linux" ]; then
  echo "Running on Linux"

  source ~/.dotfiles/install/google.sh
fi

echo "Done."
