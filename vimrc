set nocompatible

set encoding=utf-8

" Vundle

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

Bundle 'itchyny/lightline.vim'
Bundle 'altercation/vim-colors-solarized'

Bundle 'dbext.vim'

" python
Bundle 'klen/python-mode'
" Bundle 'hdima/python-syntax'

" Bundle 'tmhedberg/SimpylFold'
" Bundle 'vim-scripts/jpythonfold.vim'

Bundle 'davidhalter/jedi-vim'

filetype plugin indent on " required!

set nomodeline
set noswapfile

syntax on

set backspace=indent,eol,start

set cursorline
" set colorcolumn=+1
let &colorcolumn=join(range(&textwidth+1,256), ",")
set number
set ruler

set mouse=a

" set t_Co=256
set background=dark
colorscheme solarized
set laststatus=2
set noshowmode
set showcmd

" lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"x":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ }
    \ }

" pymode
let g:pymode_run = 0
let g:pymode_breakpoint = 0
let g:pymode_lint = 0
let g:pymode_doc = 0
let g:pymode_rope = 0
let g:pymode_motion = 0
let g:pymode_virtualenv = 0

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


" Whitespaces
set list
set listchars=eol:¬,tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set hidden

map <F2> :NERDTreeToggle<CR>
map Y y$
inoremap <C-L> <Del>

set autoread

let NERDTreeIgnore=['\.py[co]$']
