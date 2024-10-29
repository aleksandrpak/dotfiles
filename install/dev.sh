#!/bin/sh

# Go projects dir
mkdir -p ~/Projects/gocode

# Installing python
pip3 install future
pip3 install six
pip3 install websocket-client
pip3 install grip

# tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
