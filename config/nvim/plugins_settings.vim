"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" rooter config
let g:rooter_patterns = ['tags', '.git', '.git/']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-l><C-l>"

" Unused polyglot plugins
let g:polyglot_disabled = ['scala']

" Golang
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#use_cache = 1

" Rust
au BufNewFile,BufRead *.rs set filetype=rust
au BufWrite *.rs :Autoformat
autocmd! BufWritePost *.rs NeomakeProject cargo
let g:formatdef_rustfmt = '"rustfmt --write-mode=overwrite"'
let g:formatters_rust = ['rustfmt']
let g:racer_cmd = "racer"
let $RUST_SRC_PATH = "/usr/local/rust/src/"

" Haskell
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
let g:haskell_conceal_wide = 1

" VimWiki
let notes_and_todo_wiki = {}
let notes_and_todo_wiki.path = "~/Dropbox/Wiki/"
let g:vimwiki_list = [notes_and_todo_wiki]

" Markdown Preview like Github
let vim_markdown_preview_github=1

" map fuzzyfinder (CtrlP) plugin
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gw :Gwrite<cr>
nmap <silent><leader>gb :Gblame<cr>
nmap <silent><leader>gt :Gcommit<cr>

" Ag configs
let g:ag_working_path_mode="r"
nnoremap <leader>a :Ag 
nnoremap <leader>A :Ag <C-r><C-w><CR>

nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>

" only show files that are not ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" airline options
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" Elm configs
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" C# configs
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_timeout = 1
augroup omnisharp_commands
    autocmd!

    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
augroup END

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

let g:SuperTabCrMapping = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert
set completeopt+=noselect
