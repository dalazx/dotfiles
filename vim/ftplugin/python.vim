" setlocal foldmethod=expr
" setlocal foldexpr=python_folding#expr(v:lnum)
" setlocal foldtext=python_folding#text()

let g:pyindent_open_paren = '&shiftwidth'

let b:ale_fixers = ['isort', 'black', 'ruff']
let g:ale_python_ruff_options = '--unfixable=F401,F841'
