#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
sudo chown -R $(whoami):$(groups | awk '{print $1}') ~/.cache
cd ~/.config/nix
nix run nix-darwin -- switch --flake .#personal