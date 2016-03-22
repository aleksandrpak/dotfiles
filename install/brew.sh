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

# Mail
brew tap kevwil/patches
brew install kevwil/patches/mutt --with-sidebar-patch

# Dekstop
brew install caskroom/cask/brew-cask
brew cask install iterm2
brew cask install google-chrome
brew cask install google-drive
brew cask install alfred
brew cask install amethyst
brew cask install spotify
brew cask install telegram

# Font setup
brew cask install caskroom/fonts/font-hack
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

exit 0
