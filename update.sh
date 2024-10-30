#!/bin/bash

# Print all commands except echo
set -x
exec 2> >(grep -v '^\+ echo')

echo "Updating git submodules"

cd ~/.dotfiles
git submodule update --remote --merge
cd ~/.config/nix

echo "Updating flake"

# Set default flake to "personal" if no argument is provided
flake="${1:-personal}"

if [ "$(uname)" == "Darwin" ]; then
    darwin-rebuild switch --flake .#"$flake"
fi
