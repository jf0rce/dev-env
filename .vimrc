set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'git@github.com:gmarik/Vundle.vim'

Plugin 'git@github.com:tpope/vim-fugitive'
Plugin 'git@github.com:scrooloose/nerdcommenter'
Plugin 'git@github.com:tpope/vim-surround'
Plugin 'git@github.com:Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""
" Syntax and indent
""""""""""""""""""""""""""""""""""
syntax on " Turn on syntax highligthing
set showmatch  "Show matching bracets when text indicator is over them
set background=dark

colorscheme solarized
set shell=/bin/bash\ -l
" Switch on filetype detection and loads
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent

""""""""""""""""""""""""""""""""""
" Some other confy settings
""""""""""""""""""""""""""""""""""
set nu " Number lines
set hls " highlight search
set lbr " linebreak

" Use 2 space instead of tab during format
set expandtab
set shiftwidth=2
set softtabstop=2
""

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
