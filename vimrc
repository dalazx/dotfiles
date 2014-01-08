set nocompatible

set encoding=utf-8

" Vundle

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'itchyny/lightline.vim'
Bundle 'wombat256.vim'

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
colorscheme wombat256mod
set laststatus=2
set noshowmode

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
