set nocompatible
let mapleader = ' '
let maplocalleader = ' '

set encoding=utf-8

" Vundle

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Plugin 'tpope/vim-sensible'

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimfiler.vim'
" Bundle 'scrooloose/nerdtree'
" Bundle 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/ZoomWin'

" git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'nathanaelkane/vim-indent-guides'

Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'nanotech/jellybeans.vim'

" python
Bundle 'klen/python-mode'
" set rtp+=~/.vim/bundle/python-folding/
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
Plugin 'Chiel92/vim-autoformat'

filetype plugin indent on " required!

" preliminarily running sensible.vim to be able to override later
runtime! plugin/sensible.vim

set path+=**

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
set wildmenu

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
nnoremap <leader>b :<C-u>Unite -buffer-name=buffers buffer<CR>
nnoremap <leader>r :<C-u>Unite -buffer-name=registers register<CR>
nnoremap <leader>f :<C-u>Unite -buffer-name=files file_rec/async<CR>
nnoremap <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>
nnoremap <leader>g :<C-u>Unite -buffer-name=grep grep:.<CR>
nnoremap <leader>uc :<C-u>UniteResume<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
  let g:unite_source_rec_async_command =
    \ ['pt', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif

set autoread

let NERDTreeIgnore=['\.py[co]$']
let g:vimfiler_ignore_filters = ['matcher_ignore_wildignore']

" copy the current filename to the system clipboard
nnoremap <leader>yf :<C-u>let @* = expand('%')<CR>

" tags
function s:remove_tags()
    echom system('rm cscope.files cscope.out tags')
    echom 'Removed tags'
endfunction

function s:build_tags()
    echom system('find . -name \*.py > cscope.files')
    echom system('ctags -R -L cscope.files')
    echom system('cscope -Rb -i cscope.files')
    echom 'Finished building tags'
endfunction

function s:rebuild_tags()
    call s:remove_tags()
    call s:build_tags()
endfunction

command! BuildTags call s:build_tags()
command! RebuildTags call s:rebuild_tags()

if has("cscope")
  set cscopetag
  if filereadable("cscope.out")
      cscope add cscope.out
  elseif $CSCOPE_DB != ""
      cscope add $CSCOPE_DB
  endif
endif
