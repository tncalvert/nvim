augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_json
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

let g:vim_json_syntax_conceal = 0

