#!/bin/bash

# Adding Russian inout source
./macos/input_source.swift

# Importing shortcuts
defaults import com.apple.symbolichotkeys ./macos/AppleSymbolicHotKeys.plist

# Restarting UI
killall SystemUIServer
