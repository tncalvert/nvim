let g:ale_virtualtext_cursor = 1
" Enable ALE with vim-airline
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'rust': ['analyzer','cargo']}
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_completion_enabled = 1

