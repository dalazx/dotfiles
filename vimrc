set nocompatible
let mapleader = ' '
let maplocalleader = ' '

set encoding=utf-8

" Vundle

filetype off " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'

Plugin 'tpope/vim-unimpaired'
Plugin 'majutsushi/tagbar'

" git
Bundle 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Bundle 'airblade/vim-gitgutter'

Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kshenoy/vim-signature'

Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'nanotech/jellybeans.vim'

Plugin 'dense-analysis/ale'
Plugin 'github/copilot.vim'
Plugin 'tpope/vim-vinegar'

call vundle#end()         " required
filetype plugin indent on " required

" preliminarily running sensible.vim to be able to override later
runtime! plugin/sensible.vim

set ttyfast
set lazyredraw

set path+=**

set nomodeline
set noswapfile

syntax on

set backspace=indent,eol,start

set textwidth=88
set nocursorline
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

set wildignore+=.git,.github
set wildignore+=*.pyc,__pycache__
set wildignore+=cscope.files,cscope.out,tags

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
    \             [ 'readonly', 'filename', 'modified' ] ]
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
" let g:pymode_run = 0
" let g:pymode_breakpoint = 1
" let g:pymode_lint = 0
" let g:pymode_doc = 0
" let g:pymode_rope = 0
" let g:pymode_motion = 0
" let g:pymode_folding = 0
" let g:pymode_virtualenv = 1
" let g:pymode_breakpoint_bind = '<leader>pb'
" let g:pymode_run_bind = '<leader>pr'

" syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" flake8 includes pyflakes, pycodestyle and mccabe
" python3 -m pip install --user flake8 pydocstyle mypy-lang pylint
" let g:syntastic_python_checkers = [
"     \ 'flake8', 'pydocstyle', 'python', 'mypy', 'pylint']
"
" let g:syntastic_shell_checkers = ['shellcheck', 'sh']

" let g:syntastic_go_checkers = ['go', 'gofmt', 'golint']

" vim-javascript-syntax
" au FileType javascript call JavaScriptFold()

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

" tagbar
let g:tagbar_autofocus = 1

set notimeout
set ttimeout
set ttimeoutlen=10

set updatetime=250

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

set spell spelllang=en_us
set dictionary=/usr/share/dict/words

" map <F2> :NERDTreeToggle<CR>
" map <F2> :VimFilerExplorer<CR>
map <F3> :TagbarToggle<CR>
map Y y$
inoremap <C-L> <Del>
" nnoremap <leader>jd :YcmCompleter GoTo<CR>
map OM <CR>
map! OM <CR>
nnoremap <leader>pi :silent !isort %<CR>:redraw!<CR>
nnoremap <leader>pf :silent !black %<CR>:redraw!<CR>
nnoremap <leader>pp :silent !isort %<CR>:silent !black %<CR>:redraw!<CR>

cabbr <expr> %% expand("%:h")

set grepprg=rg\ --vimgrep\ --smart-case\ --no-ignore\ -g\ '!tags'\ -g\ '!cscope*'
nnoremap <leader>g :G<CR>
command! -nargs=0 G execute 'silent grep! '.input('grep: ') | copen | redraw!

" Unite
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>b :<C-u>Unite -buffer-name=buffers buffer<CR>
" nnoremap <leader>r :<C-u>Unite -buffer-name=registers register<CR>
" nnoremap <leader>f :<C-u>Unite -buffer-name=files file_rec/async<CR>
" nnoremap <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>
" " nnoremap <leader>g :<C-u>Unite -buffer-name=grep grep:.<CR>
" nnoremap <leader>uc :<C-u>UniteResume<CR>
" " if executable('pt')
" "   let g:unite_source_grep_command = 'pt'
" "   let g:unite_source_grep_default_opts = '--nogroup --nocolor'
" "   let g:unite_source_grep_recursive_opt = ''
" "   let g:unite_source_grep_encoding = 'utf-8'
" "   let g:unite_source_rec_async_command =
" "     \ ['pt', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
" " endif
"
" call unite#custom#source(
"     \ 'file_mru', 'matchers',
"     \ ['matcher_project_files', 'matcher_fuzzy'])

set autoread

" let NERDTreeIgnore=['\.py[co]$']
" let g:vimfiler_ignore_filters = ['matcher_ignore_wildignore']

" copy the current filename to the system clipboard
nnoremap <leader>yf :<C-u>let @* = expand('%')<CR>

" tags
function s:remove_tags()
    echom system('rm cscope.files cscope.out tags')
    echom 'Removed tags'
endfunction

function s:build_tags()
    echom system('find . -name \*.py > cscope.files')
    echom system('find /usr/local/Cellar/python -name \*.py >> cscope.files')
    echom system('find . -name \*.sh >> cscope.files')
    " see https://leonard.io/blog/2013/04/editing-scala-with-vim/
    echom system('find . -name \*.scala >> cscope.files')
    echom system('find . -name \*.java >> cscope.files')
    echom system('find . -name \*.go >> cscope.files')
    echom system('ctags -R -L cscope.files')
    echom system('cscope -Rb -i cscope.files')
    cscope reset
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

if executable("gtags-cscope")
    " https://www.gnu.org/software/global/globaldoc_toc.html#Gtags_002dcscope
    set cscopeprg=gtags-cscope
    " cscope add is only needed here to establish a connection.
    " vim checks whether the file exists and passes it as follows:
    " gtags-cscope -dl -f GTAGS
    " but the -f argument is completely ignored in gtags-cscope!
    cscope add GTAGS
elseif executable("cscope")
  if filereadable("cscope.out")
      " TODO: actually this might be reused for gtags provided the file exists
      cscope add cscope.out
  elseif $CSCOPE_DB != ""
      cscope add $CSCOPE_DB
  endif
endif

inoremap <Esc>[ <Plug>(copilot-previous)
inoremap <Esc>] <Plug>(copilot-next)
inoremap <Esc>\ <Plug>(copilot-suggest)
inoremap <Esc><Tab> <Plug>(copilot-accept-word)
inoremap <Esc><S-Tab> <Plug>(copilot-accept-line)

let g:copilot_node_command = "~/.nodenv/versions/20.18.1/bin/node"
