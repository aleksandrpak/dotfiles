# g4d completions
if [[ -a /etc/bash_completion.d/g4d ]]; then
    source /etc/bash_completion.d/g4d
fi

# hgd completions
if [[ -a /etc/bash_completion.d/hgd ]]; then
    source /etc/bash_completion.d/hgd
fi

# go/hi
if [[ -a /etc/bash.bashrc.d/shell_history_forwarder.sh ]]; then
    source /etc/bash.bashrc.d/shell_history_forwarder.sh
fi

# blaze completions
if [ -d /google/data ]; then
    fpath=(/google/src/files/head/depot/google3/devtools/blaze/scripts/zsh_completion $fpath)
fi