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

if filereadable(expand('~/.at_google'))
  " Formatter
  nnoremap <leader>ff :FormatCode<CR>

  "let g:ycm_clangd_binary_path="/google/bin/releases/editor-devtools/ciderlsp"
  if executable('/usr/bin/clangd')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['/usr/bin/clangd', '--index-service=blade:fozzie']},
          \ 'whitelist': ['c', 'cpp'],
          \ })
  endif
endif

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

" Async complete
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
