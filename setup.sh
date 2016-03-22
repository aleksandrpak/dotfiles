read -p "System Preferences -> Keyboard -> Keyboard -> Use all F1, F2, etc. keys as standard function keys"
read -p "System Preferences -> Keyboard -> Input Sources -> Add Russian"
read -p "System Preferences -> Keyboard -> Shortcuts -> Input Sources: Command + Space"
read -p "System Preferences -> Keyboard -> Shortcuts -> Mission Control: Disable F11, F12"
read -p "System Preferences -> Desktop & Screen Saver -> Desktop -> Solid Colors -> Solid Gray Dark"
read -p "System Preferences -> General -> Enable 'Use dark menu bar and Dock'"
read -p "System Preferences -> Notifications -> Do Not Disturb -> From 05:00 to 04:59"
read -p "Finder -> Preferences -> New Finder Window show: Downloads"
read -p "install Taurine from AppStore"
read -p "install Pocket from AppStore"

#Set a blazingly fast keyboard repeat rate
sudo defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# disabling guest access
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO

# installing brew and all required packages
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git libconfig readline lua python libevent jansson wget
brew install the_silver_searcher cmake webp offlineimap sqlite urlview
brew install msmtp contacts notmuch sbt haskell-stack go mono diff-so-fancy
brew install caskroom/cask/brew-cask
curl -Lo- https://bootstrap.pypa.io/get-pip.py | sudo python
sudo pip install websocket-client

# installing python and ml
sudo pip install future
sudo pip install six

# instaling rust
curl -sf -L https://static.rust-lang.org/rustup.sh | sh

# installing java & scala
brew cask install java
brew install scala
curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh

wget -O ~/Downloads/seoul256.itermcolors https://raw.githubusercontent.com/mikker/seoul256-iTerm2/master/seoul256.itermcolors

read -p "Configure dock: Finder | iTerm | Chrome | iMessage | Calendar"
read -p "Launch iTerm: iTerm top menu -> Make iTerm2 default Term"

mkdir -p ~/Projects/gocode
mkdir -p ~/.sbt/0.13/plugins/
echo 'addSbtPlugin("org.ensime" % "ensime-sbt" % "0.1.7")' >> ~/.sbt/0.13/plugins/plugins.sbt

# configuring git
ssh-keygen -t rsa -b 4096 -C "alekspak@icloud.com" -P "" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

# installing vim bundles
nvim +PlugInstall +qall

cd ~/.vim/bundle/omnisharp-vim/omnisharp-roslyn
./build.sh

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --gocode-completer --omnisharp-completer --racer-completer

# setting up mail
mkdir ~/bin
mkdir ~/.mail
mkdir ~/.mutt
mkdir ~/.mutt/temp
mkdir ~/.mutt/themes
wget -O ~/.offlineimaprc https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/.offlineimaprc
wget -O ~/.mutt/offlineimap.py https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/offlineimap.py
wget -O ~/.mutt/view_attachment.sh https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/view_attachment.sh
wget -O ~/.mutt/mailcap https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/mailcap
wget -O ~/.mutt/Equifax_Secure_CA.cert https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/Equifax_Secure_CA.cert
wget -O ~/.notmuch-config https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/.notmuch-config
wget -O ~/.urlview https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/.urlview
wget -O ~/.msmtprc https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/.msmtprc
wget -O ~/.muttrc https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/.muttrc
wget -O ~/bin/mutt-notmuch-py https://raw.githubusercontent.com/honza/mutt-notmuch-py/master/mutt-notmuch-py
wget -O ~/.mutt/themes/solarized https://raw.githubusercontent.com/aleksandrpak/scripts/master/environment/mac/solarized

chmod +x ~/.mutt/view_attachment.sh
chmod +x ~/bin/mutt-notmuch-py
offlineimap
notmuch new
