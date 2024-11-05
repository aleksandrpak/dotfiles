#!/bin/bash

cd ~/.dotfiles

echo "Relinking files"
source ./install/link.sh

# Print all commands except echo
set -x
exec 2> >(grep -v '^\+ echo')

echo "Updating git submodules"

git submodule update --remote --merge

echo "Updating flake"

if [ "$(uname)" == "Darwin" ]; then
    darwin-rebuild switch --flake ~/.dotfiles/nix
fi
# home-manager switch

# tmux plugins
tmux run-shell ~/.tmux/plugins/tpm/scripts/install_plugins.sh
