# bin paths
export PATH=$PATH:$DOTFILES/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin

# Golang variables
export GOPATH=$HOME/Projects/gocode
export PATH=$PATH:$GOPATH/bin

# Rust variables
export PATH=$PATH:~/.cargo/bin

# Flutter
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:~/Library/Android/sdk/cmdline-tools/latest/bin
export PATH=$PATH:~/.pub-cache/bin

# Nix
export NIX_PATH="$NIX_PATH:$HOME/.nix-defexpr/channels"
export PATH=$PATH:~/.nix-profile/bin/
source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

# Libraries
# Required for libiconv
export LIBRARY_PATH=$(nix path-info nixpkgs#libiconv)/lib
export CPATH=$(nix path-info nixpkgs#libiconv)/include
