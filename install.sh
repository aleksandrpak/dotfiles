#!/bin/bash

# Print all commands except echo
set -x
exec 2> >(grep -v '^\+ echo')

echo "Installing dotfiles"

echo "Initializing submodule(s)"
cd ~/.dotfiles || exit

git submodule update --init --recursive

source ./install/link.sh
source ./install/functions.sh

echo "Creating temp vim directory"
mkdir -p ~/.tmp

echo "Creating Go projects directory"
mkdir -p ~/Projects/gocode

echo "Creating ZSH cache directory"
mkdir -p ~/.zsh/cache

echo "Installing Nix"
source ./install/nix.sh

if at_google; then
    echo "Running on gLinux"
    source ./install/google.sh
fi

# tmux plugins
tmux run-shell ~/.tmux/plugins/tpm/scripts/install_plugins.sh

echo "Done."
