#!/bin/sh

# Instaling Rust
curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src

# Installing Go
get go
mkdir -p ~/Projects/gocode
go get -u github.com/nsf/gocode

# Installing python
get python
get python3
pip install --upgrade pip
pip install future
pip install six
pip install websocket-client
pip install grip
