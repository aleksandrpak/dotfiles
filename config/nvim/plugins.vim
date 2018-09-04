call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'chriskempson/base16-vim'

" utilities
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, mapped to <leader>t
Plug 'rking/ag.vim' " search inside files using ag. Same as command line ag utility
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete

" language-specific plugins
Plug 'sheerun/vim-polyglot' " collection of language specific plugins
Plug 'Chiel92/vim-autoformat' " Auto format files
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim

call plug#end()


