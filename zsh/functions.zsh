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

# find shorthand
function f() {
    find . -iname "$1"
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
}

function dark() {
    export BACKGROUND="dark" && reload
}

fpath=($ZSH/functions $fpath)
autoload -U $ZSH/functions/*(:t)