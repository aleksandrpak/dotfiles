#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# CLI and development
brew install ack
brew install tree
brew install wget
brew install thefuck
brew install fasd
brew install git
brew install hub
brew install tmux
brew install zsh
brew install macvim --override-system-vim
brew install neovim/neovim/neovim

exit 0
