"
" Vim
"

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"
" JSON
"

augroup filetype_json
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

let g:vim_json_syntax_conceal = 0

"
" Rust
"

let g:rust_fold = 1

