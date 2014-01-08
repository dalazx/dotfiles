set nocompatible

set encoding=utf-8

" Vundle

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'itchyny/lightline.vim'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on " required!

set nomodeline
set noswapfile

syntax on

set backspace=indent,eol,start

set cursorline
set number
set ruler

set mouse=a

set t_Co=256
colorscheme solarized
set laststatus=2
set noshowmode
set showcmd

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \}

set ttimeoutlen=50

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Wrapping
set nowrap

" Indentation

" Python
set expandtab
set shiftwidth=4
set softtabstop=4
