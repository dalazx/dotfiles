set nocompatible
let mapleader = ' '

set encoding=utf-8

" Vundle

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimfiler.vim'
" Bundle 'scrooloose/nerdtree'
" Bundle 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/ZoomWin'

Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'

Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'nanotech/jellybeans.vim'

" Bundle 'dbext.vim'

" python
Bundle 'klen/python-mode'
" Bundle 'alfredodeza/coveragepy.vim'

" Bundle 'hdima/python-syntax'
" Bundle 'tmhedberg/SimpylFold'
" Bundle 'vim-scripts/jpythonfold.vim'

" jinja 2
" Plugin 'mitsuhiko/vim-jinja'
" Plugin 'Glench/Vim-Jinja2-Syntax'

" Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'

Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
" Plugin 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'

filetype plugin indent on " required!

set nomodeline
set noswapfile

syntax on

set backspace=indent,eol,start

set cursorline
set colorcolumn=+1
" let &colorcolumn=join(range(&textwidth+1,256), ",")
set number
set ruler

set mouse=a

" set t_Co=256
set background=dark
colorscheme jellybeans
set laststatus=2
set noshowmode
set showcmd

" vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" hi IndentGuidesOdd ctermbg=151515
" hi IndentGuidesOdd ctermbg=1c1c1c

" lightline
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'filename': '%{expand("%") != "" ? expand("%") : "[No Name]"}',
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
" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = 'jellybeans'
let g:tmuxline_preset = 'full'

" pymode
let g:pymode_run = 0
let g:pymode_breakpoint = 1
let g:pymode_lint = 0
let g:pymode_doc = 0
let g:pymode_rope = 0
let g:pymode_motion = 0
let g:pymode_virtualenv = 1

" syntastic
let g:syntastic_python_checkers = ['pylama']

" vim-javascript-syntax
au FileType javascript call JavaScriptFold()

" tagbar
let g:tagbar_autofocus = 1

set notimeout
set ttimeout
set ttimeoutlen=10

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

" map <F2> :NERDTreeToggle<CR>
map <F2> :VimFilerExplorer<CR>
map <F3> :TagbarToggle<CR>
map Y y$
inoremap <C-L> <Del>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
map OM <CR>
map! OM <CR>

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :<C-u>Unite -buffer-name=files
    \ buffer file_mru file_rec/async<CR>

set autoread

let NERDTreeIgnore=['\.py[co]$']
