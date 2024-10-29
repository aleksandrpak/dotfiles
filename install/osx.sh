#!/usr/bin/env sh

echo "Reduce window resize time"
defaults write -g NSWindowResizeTime -float 0.001

echo "Reduce desktop switching animation time"
defaults write com.apple.dock expose-animation-duration -int 0

echo "only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "expand save dialog by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Reset Launchpad"
[ -e ~/Library/Application\ Support/Dock/*.db ] && rm -f ~/Library/Application\ Support/Dock/*.db

echo "Kill affected applications"
for app in Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done
