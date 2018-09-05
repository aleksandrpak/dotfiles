"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Settings that can be incompatible with other vims
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('mouse')
    set mouse=a
endif

" Cursor shape in different modes for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Theme
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.tmp
set directory=~/.tmp
