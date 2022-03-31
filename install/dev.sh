#!/bin/sh

# Instaling Rust
curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src

# Installing Go
get go
mkdir -p ~/Projects/gocode

# Installing python
get python
pip install --upgrade pip
pip install future
pip install six
pip install websocket-client
pip install grip
