# reload zsh config
alias reload='source ~/.zshrc'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias l="eza --icons=always --color=always --long --no-user --no-time --no-permissions --no-filesize"
alias ls="eza --icons=always --color=always --long --git -a"
alias tree="eza --tree --icons=always"
alias trees="eza --tree --icons=always --level=2"

# search hidden
alias rgh="rg --hidden"
alias ag="rg"
alias agh="rg --hidden"

# Helpers
alias xx="exit"
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Weather
alias wt="curl https://wttr.in/zurich\?m"

# git aliases
alias ga='git add'
alias gc='git commit -am'
alias gl='git pull'
alias gp='git push'
alias gf='git diff'
alias gs='git s'

# hg aliases
alias hs="hg status"
alias hf="hg diff"
alias ha="hg amend -i"
alias hc="hg commit -i"
alias hl="hg sync -a"
alias hp="hg uploadall"
alias hh="hg shelve"
alias hu="hg unshelve"
