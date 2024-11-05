#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
# sudo apt install nix
# nix-channel --add https://nixos.org/channels/nixpkgs-unstable && nix-channel --update nixpkgs
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update
# nix-shell '<home-manager>' -A install
sudo chown -R $(whoami):$(groups | awk '{print $1}') ~/.cache
source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
nix run nix-darwin -- switch --flake ~/.dotfiles/nix
