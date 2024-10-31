# normal priority for background jobs
setopt NO_BG_NICE
# don't send ^c to background jobs on shell exit
setopt NO_HUP
# no beeping on ambigious completions
setopt NO_BEEP
# options are local to function
setopt LOCAL_OPTIONS
# traps are local to function
setopt LOCAL_TRAPS
# aliases are treated as normal commands for completion
setopt COMPLETE_ALIASES

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase

# always append history
setopt APPEND_HISTORY
# share history between sessions
setopt SHARE_HISTORY
# save timestamps and durations
setopt EXTENDED_HISTORY
# don't execute after selection in history
setopt HIST_VERIFY
# trim saved commands
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^r' history-incremental-search-backward

# display how long all tasks over 10 seconds take
export REPORTTIME=10