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

" These are the tweaks I apply to YCM's config, you don't need them but they might help.
" YCM gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Golang
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Rust
au BufNewFile,BufRead *.rs set filetype=rust
au BufWrite *.rs :Autoformat
let g:formatdef_rustfmt = '"rustfmt --write-mode=overwrite"'
let g:formatters_rust = ['rustfmt']
let g:ycm_rust_src_path = "/usr/local/rust/src"

" Haskell
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd BufWritePost *.hs GhcModCheckAndLintAsync
let g:haskell_conceal_wide = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}

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

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

let g:SuperTabCrMapping = 0

