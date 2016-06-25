#!/bin/sh

echo "Installing homebrew packages..."

# Compiling and libraries
get cmake
get libconfig
get libevent
get readline
get jansson
get webp --with-giflib --with-libtiff

# # CLI
get reattach-to-user-namespace
get tree
get the_silver_searcher
get wget
get thefuck
get fasd
get git
get hub
get zsh
get tmux
get zsh-syntax-highlighting
get aria2

# Development
get sqlite
get lua --with-completion
get neovim/neovim/neovim
get asciinema

# Mail
get offlineimap
get msmtp
get notmuch
get urlview
get mutt --with-sidebar-patch

# Dekstop
get_desktop iterm2
get_desktop google-chrome
get_desktop dropbox
get_desktop alfred
get_desktop amethyst
get_desktop spotify
get_desktop telegram
get_desktop slack

# Font setup
get_desktop caskroom/fonts/font-hack

cd ~/Library/Fonts
if [ ! -e "Droid Sans Mono for Powerline Nerd Font Complete.otf" ]
then
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf
fi

