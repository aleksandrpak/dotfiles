#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# Compiling and libraries
brew install cmake
brew install libconfig
brew install libevent
brew install readline
brew install jansson
brew install webp --with-giflib --with-libtiff

# CLI
brew install tree
brew install the_silver_searcher
brew install wget
brew install thefuck
brew install fasd
brew install git
brew install hub
brew install zsh
brew install tmux

# Development
brew install sqlite
brew install macvim --with-override-system-vim
brew install lua --with-completion
brew install neovim/neovim/neovim

# Mail
brew install offlineimap
brew install msmtp
brew install notmuch
brew install urlview
brew tap kevwil/patches
brew install kevwil/patches/mutt --with-sidebar-patch

# Dekstop
brew install caskroom/cask/brew-cask
brew cask install iterm2
brew cask install google-chrome
brew cask install dropbox
brew cask install alfred
brew cask install amethyst
brew cask install spotify
brew cask install telegram
brew cask install slack

# Font setup
brew cask install caskroom/fonts/font-hack
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
