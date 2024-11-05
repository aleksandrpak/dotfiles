#!/bin/bash

source ./functions.sh

if at_google; then
    sudo apt install nix
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable && nix-channel --update nixpkgs
else
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
fi

source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
sudo chown -R "$(whoami):$(groups | awk '{print $1}')" ~/.cache

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

if [ "$(uname)" == "Darwin" ]; then
    nix run nix-darwin -- switch --flake ~/.dotfiles/config/home-manager
elif [ "$(uname)" == "Linux" ]; then
    home-manager switch
fi
