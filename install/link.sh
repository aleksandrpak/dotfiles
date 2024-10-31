#!/bin/bash

DOTFILES=$HOME/.dotfiles

create_symlink() {
    local source=$1
    local target=$2

    if [ -e "$target" ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $source"
        ln -s "$source" "$target"
    fi
}

echo -e "\nCreating symlinks"
echo "=============================="

# Find and link .symlink files
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables; do
    target="$HOME/.$( basename "$file" ".symlink" )"
    create_symlink "$file" "$target"
done

# Link files under ~/.config
echo -e "\nInstalling to ~/.config"
echo "=============================="
if [ ! -d "$HOME/.config" ]; then
    echo "Creating ~/.config"
    mkdir -p "$HOME/.config"
fi

for config in "$DOTFILES"/config/*; do
    target="$HOME/.config/$( basename "$config" )"
    create_symlink "$config" "$target"
done

# Custom symlinks
create_symlink "$DOTFILES/tmux/tpm" "$HOME/.tmux/plugins/tpm"
