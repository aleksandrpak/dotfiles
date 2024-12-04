#!/bin/bash

# Adding Russian inout source
./macos/input_source.swift

# Importing shortcuts
defaults import com.apple.symbolichotkeys ./macos/AppleSymbolicHotKeys.plist

# Set default finder to be ~/Downloads/
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

# Restarting UI
killall SystemUIServer
killall Finder
