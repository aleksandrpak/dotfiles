#!/bin/bash

if [ "$(uname)" == "Linux" ]
then
  if tmux > /dev/null 2>&1
  then
    echo "tmux is already installed. skipping."
  else
    sudo apt-get install tmux
  fi
fi
