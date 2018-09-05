"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autoformat on save
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
augroup END

" CtrlP configs
let g:ctrlp_map='<leader>t'
nnoremap <leader>r :CtrlPBuffer<CR>
let g:ctrlp_root_markers = ['METADATA']

" Use AG for CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ --ignore .git5_specs
        \ --ignore review
        \ -g ""'

endif

" Ag configs
let g:ag_working_path_mode="r"
nnoremap <leader>a :Ag 
nnoremap <leader>A :Ag <C-r><C-w><CR>

" airline options
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" Formatter (google?)
if filereadable(expand('~/.at_google'))
  nnoremap <leader>ff :FormatCode<CR>
endif
