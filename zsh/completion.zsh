zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# display color in completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# use fzf menu instead of standard
zstyle ':completion:*' menu no

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# completion preview
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'