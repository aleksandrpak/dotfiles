#!/bin/bash

if [ "$(uname)" == "Linux" ]
then
  if nvim > /dev/null 2>&1
  then
    echo "nvim is already installed. skipping."
  else
    sudo apt-get install libtool autoconf automake cmake g++ pkg-config python-pip python-dev

    rm -rf ~/tmp && mkdir ~/tmp && cd ~/tmp
    git clone --branch v0.1.6 https://github.com/neovim/neovim.git

    cd neovim
    make install CMAKE_EXTRA_FLAGS=-DCMAKE_INSTALL_PREFIX=$HOME/.local CMAKE_BUILD_TYPE=Release
    pip2 install --user neovim
  fi
fi
