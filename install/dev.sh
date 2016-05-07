#!/bin/sh

# Instaling Rust
curl -sf -L https://static.rust-lang.org/rustup.sh | sh
git clone https://github.com/rust-lang/rust.git /usr/local/rust
cargo install rustfmt

# Creating Mendix environment
mkdir -p ~/Mendix/bin

# Installing Go
brew install go
mkdir -p ~/Projects/gocode

# Installing Haskell
brew install haskell-stack
brew install cabal-install
cabal update
cabal install happy
cabal install ghc-mod

# Installing mono
brew install mono

# Installing python
brew install python
brew install python3
brew link python
pip install --upgrade pip
pip install future
pip install six
pip install websocket-client
pip install grip

# Installing nvim bundles
pip install neovim --upgrade
echo "iExecute :PlugInstall and close vim" | nvim

# Installing Java & Scala
brew cask install java
brew install scala
brew install sbt
curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh

# Building auto-complete
cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer --gocode-completer --racer-completer

# Copying scripts to ~/bin
chmod +x ~/.dotfiles/bin/tm
chmod +x ~/.dotfiles/bin/mxbin

# iTerm2 shell integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash

# Generate ssh key for git
ssh-keygen -t rsa -b 4096 -C "alekspak@icloud.com" -P "" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
