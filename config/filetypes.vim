augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_json
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+

    set conceallevel=0
augroup END

