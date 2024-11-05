#!/bin/bash

cd ~/.dotfiles || exit

echo "Relinking files"
source ./install/link.sh

# Print all commands except echo
set -x
exec 2> >(grep -v '^\+ echo')

echo "Updating git submodules"

git submodule update --remote --merge

echo "Updating flake"
nix-channel --update

if [ "$(uname)" == "Darwin" ]; then
    darwin-rebuild switch --flake ~/.dotfiles/config/home-manager
elif [ "$(uname)" == "Linux" ]; then
    home-manager switch
fi

# tmux plugins
tmux run-shell ~/.tmux/plugins/tpm/scripts/install_plugins.sh
