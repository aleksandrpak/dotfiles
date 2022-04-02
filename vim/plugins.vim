if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if filereadable(expand('~/.at_google'))
  Glug codefmt gofmt_executable="goimports"
  Glug codefmt-google
  Glug blazedeps auto_filetypes=`['go']`
endif

call plug#begin('~/.vim/plugged')

if !filereadable(expand('~/.at_google'))
endif

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'

Plug 'chriskempson/base16-vim' " colorschema
Plug 'rking/ag.vim' " search inside files using ag. Same as command line ag utility
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, mapped to <leader>t
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'fatih/vim-go' " Go lang

Plug 'tmux-plugins/vim-tmux' " tmux syntax

call plug#end()
