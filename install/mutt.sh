#!/bin/sh

mkdir ~/.mail
mkdir -p ~/.mutt/temp
mkdir ~/.mutt/themes

cp ~/.dotfiles/bin/mutt-notmuch-py ~/bin/mutt-notmuch-py

chmod +x ~/.mutt/view_attachment.sh
chmod +x ~/bin/mutt-notmuch-py
