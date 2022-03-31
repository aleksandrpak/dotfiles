#!/bin/sh

# Instaling Rust
curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src

# Installing Go
get go
mkdir -p ~/Projects/gocode

# Installing python
get python
pip3 install future
pip3 install six
pip3 install websocket-client
pip3 install grip

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
