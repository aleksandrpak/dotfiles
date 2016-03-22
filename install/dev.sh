#!/bin/sh

# Instaling Rust
curl -sf -L https://static.rust-lang.org/rustup.sh | sh

# Installing Go
brew install go
mkdir -p ~/Projects/gocode

# Installing Haskell
brew install haskell-stack

# Installing mono
brew install mono

# Installing python
brew install python
brew link python
pip install --upgrade pip
pip install future
pip install six
pip install websocket-client

# Installing nvim bundles
pip install neovim --upgrade
nvim +PlugInstall

# Installing Java & Scala
brew cask install java
brew install scala
brew install sbt
curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh

# Getting ensime for Scala
if [ ! -d ~/.sbt/0.13/plugins ]; then
    mkdir -p ~/.sbt/0.13/plugins
    echo 'addSbtPlugin("org.ensime" % "ensime-sbt" % "0.1.7")' >> ~/.sbt/0.13/plugins/plugins.sbt
fi

# Building refactoring tools for C#
cd ~/.config/nvim/plugged/omnisharp-vim/omnisharp-roslyn
./build.sh

# Building auto-complete
cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer --gocode-completer --racer-completer --omnisharp-completer

# Generate ssh key for git
ssh-keygen -t rsa -b 4096 -C "alekspak@icloud.com" -P "" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
