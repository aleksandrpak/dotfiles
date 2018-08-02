#!/bin/sh

os_name() {
    if [ "$(uname)" == "Darwin" ]
    then
        echo "OSX"
    else
        echo "Unknown"
    fi
}

get_brew() {
    if test ! $(which brew); then
        echo "Installing homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

osx_get() {
    // TODO: Also check if binary exists
    if brew ls $1 > /dev/null 2>&1
    then
        echo "$1 is already installed. skipping."
    else
        brew install $*
    fi
}

osx_get_desktop() {
    if brew cask ls $1 > /dev/null 2>&1
    then
        echo "$1 is already installed. skipping."
    else
        brew cask install $*
    fi
}

prepare_osx() {
    get_brew

    brew tap kevwil/patches
    brew tap caskroom/cask
    brew tap dart-lang/dart
}

get() {
    if [ "$( os_name )" == "OSX" ]
    then
        osx_get $*
    else
        echo "unknown os. get operation ignored."
    fi
}

get_desktop() {
    if [ "$( os_name )" == "OSX" ]
    then
        osx_get_desktop $*
    else
        echo "unknown os. get desktop operation ignored."
    fi
}

