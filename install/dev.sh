#!/bin/sh

# Instaling Rust
curl -sf -L https://static.rust-lang.org/rustup.sh | sh
git clone https://github.com/rust-lang/rust.git /usr/local/rust
cd /usr/local/rust
git pull
cargo install rustfmt

# Installing Go
get go
mkdir -p ~/Projects/gocode

# Installing Haskell
get ghc
get haskell-stack
get cabal-install
cabal update
cabal install happy
cabal install ghc-mod

# Installing mono
get mono

# Installing python
get python
get python3
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
get_desktop install java
get scala
get sbt
curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh

# Building auto-complete
cd ~/.config/nvim/plugged/YouCompleteMe
./install.py --clang-completer --gocode-completer --racer-completer

# iTerm2 shell integration
curl -L https://iterm2.com/misc/install_shell_integration.sh | bash
