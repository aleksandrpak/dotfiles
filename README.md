# dotfiles

## Initial Setup and Installation

Clone the dotfiles repository to your computer.

```bash
git clone git@github.com:aleksandrpak/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
sh install.sh
```

`install.sh` will install all symbolic links into your home directory. Every file with a `.symlink` extension will be symlinked to the home directory with a `.` in front of it. As an example, `zshrc.symlink` will be symlinked in the home directory as `~/.zshrc`. Then, this script will create a `~/.vim-tmp` directory in your home directory, as this is where vim is configured to place its temporary files. Additionally, all files in the `$DOTFILES/config` directory will be symlinked to the `~/.config/` directory for applications that follow the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html).

## Things to automate in OSX

Some of the procedures are still required automation:

* System Preferences -> Keyboard -> Input Sources -> Add Russian
* System Preferences -> Keyboard -> Shortcuts -> Input Sources: Command + Space
* System Preferences -> Keyboard -> Shortcuts -> Mission Control: Disable F11, F12
* System Preferences -> Keyboard -> Shortcuts -> Mission Control -> Enable shortcuts for desktops
* Finder -> Preferences -> New Finder Window show: Downloads