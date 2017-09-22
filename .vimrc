set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'git@github.com:gmarik/Vundle.vim'

Plugin 'git@github.com:tpope/vim-fugitive'
Plugin 'git@github.com:tpope/vim-surround'
Plugin 'git@github.com:tpope/vim-rails'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'git@github.com:ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""
" Syntax and indent
""""""""""""""""""""""""""""""""""
syntax on " Turn on syntax highligthing
set showmatch  "Show matching bracets when text indicator is over them
set background=dark
set backspace=indent,eol,start

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

" Ctrl-P settings
nnoremap <leader>p :CtrlP<CR>
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_custom_ignore = { 'dir':'\v[\/](\.git|\.hg|\.svn|tmp|node_modules|deps|_build)$' }
let g:ctrlp_jump_to_buffer=0 "Do not jump to a different tab. This was screwing up the buffer list.
let g:ctrlp_use_caching=0 "Does not cache files now
" END Ctrl-P settings

" Custom mappings
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" End custome mappings

set directory=~/.vim/swapfiles//

" Use 2 space instead of tab during format
set expandtab
set shiftwidth=2
set softtabstop=2
""

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif
