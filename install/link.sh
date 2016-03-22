#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles

echo "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo "\nInstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi

for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

echo "\nCreating symlink for mutt"
echo "=============================="
MUTT_SOURCE=$DOTFILES/mutt
MUTT_TARGET=$HOME/.mutt
if [ -e $MUTT_TARGET ]; then
    echo "~${MUTT_TARGET#HOME} already exists... Skipping."
else
    echo "Creating symlink for $MUTT_SOURCE"
    ln -s $MUTT_SOURCE $MUTT_TARGET
fi
