# send a notification
function ntfy() {
  local message="$1"
  curl -s -d "$message" ntfy.sh/5HcsB1VfGAoc4QqVhXPMBYgKE2s97tfN
}

# run command and send a notification
function rntfy() {
  local message="$1"  # First argument is the message
  shift               # Shift to access the remaining arguments as the command

  # Run the command and store the exit status
  "$@"
  local exit_code=$?

  # Send notification based on success or failure
  if [ $exit_code -eq 0 ]; then
    ntfy_notify "$message"
  else
    ntfy "Command failed with status $exit_code"
  fi
}

# print available colors and their numbers
function colours() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}m colour${i}"
        if (( $i % 5 == 0 )); then
            printf "\n"
        else
            printf "\t"
        fi
    done
}

# Extract archives - use: extract <file>
# Credits to http://dotfiles.org/~pseup/.bashrc
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) rar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# set the background color to light
function light() {
    export BACKGROUND="light" && reload
    if [ "$(uname)" == "Darwin" ]; then
        for addr in $(fd "nvim[0-9\.]+$" /var/folders); do
            nvim --server $addr --remote-send ':lua require("nvchad.utils").reload() <cr>'
        done
    fi
}

function dark() {
    export BACKGROUND="dark" && reload
    if [ "$(uname)" == "Darwin" ]; then
        for addr in $(fd "nvim[0-9\.]+$" /var/folders); do
            nvim --server $addr --remote-send ':lua require("nvchad.utils").reload() <cr>'
        done
    fi
}

# This function emits an OSC 1337 sequence to set a user var
# associated with the current terminal pane.
# It requires the `base64` utility to be available in the path.
# This function is included in the wezterm shell integration script, but
# is reproduced here for clarity
wezterm_set_user_var() {
  if hash base64 2>/dev/null ; then
    if [[ -z "${TMUX}" ]] ; then
      printf "\033]1337;SetUserVar=%s=%s\007" "$1" `echo -n "$2" | base64`
    else
      # <https://github.com/tmux/tmux/wiki/FAQ#what-is-the-passthrough-escape-sequence-and-how-do-i-use-it>
      # Note that you ALSO need to add "set -g allow-passthrough on" to your tmux.conf
      printf "\033Ptmux;\033\033]1337;SetUserVar=%s=%s\007\033\\" "$1" `echo -n "$2" | base64`
    fi
  fi
}

fpath=($ZSH/functions $fpath)
