#!/bin/bash

# Print all commands except echo
set -x
exec 2> >(grep -v '^\+ echo')

echo "Installing dotfiles"

echo "Initializing submodule(s)"
cd ~/.dotfiles || exit

git submodule update --init --recursive

source ./install/functions.sh
source ./install/dir.sh
source ./install/link.sh

echo "Installing Nix"
source ./install/nix.sh

if at_google; then
    echo "Running on gLinux"
    source ./install/google.sh
fi

# Make ZSH default shell
sudo which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"

# tmux plugins
tmux run-shell ~/.tmux/plugins/tpm/scripts/install_plugins.sh

rustup default stable

echo "Done."
