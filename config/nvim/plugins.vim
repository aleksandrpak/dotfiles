call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'chriskempson/base16-vim'

" utilities
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, mapped to <leader>t
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
Plug 'airblade/vim-rooter' " changing root folder to version control root
Plug 'rking/ag.vim' " search inside files using ag. Same as command line ag utility
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'machakann/vim-sandwich' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'airblade/vim-gitgutter' " added/removed/modified lines for git
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'SirVer/ultisnips' " snippet manager
Plug 'honza/vim-snippets' " collection of snippets
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'ervandew/supertab' " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'vimwiki/vimwiki' " wiki for notes and todo
Plug 'wellle/tmux-complete.vim' " autocomplete from tmux

" language-specific plugins
Plug 'sheerun/vim-polyglot' " collection of language specific plugins
Plug 'derekwyatt/vim-scala' " scala specific plugin
Plug 'Chiel92/vim-autoformat' " Auto format files
Plug 'Valloric/YouCompleteMe' " auto complete for multiple languages
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'JamshedVesuna/vim-markdown-preview' " Preview markdown in browser
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'fatih/vim-go', { 'for': 'go' } " go support

" Haskell plugins
Plug 'dag/vim2hs' " collection of scripts
Plug 'eagletmt/neco-ghc' " auto-complete
Plug 'eagletmt/ghcmod-vim' " ghc-mod to vim
Plug 'enomsg/vim-haskellConcealPlus' " concealing

call plug#end()
