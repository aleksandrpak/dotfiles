#!/bin/sh

# Instaling Rust
curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly
git clone https://github.com/rust-lang/rust.git /usr/local/rust
cd /usr/local/rust
git pull
cargo install rustfmt
cargo install racer

# Installing Go
get go
mkdir -p ~/Projects/gocode
go get -u github.com/nsf/gocode

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
