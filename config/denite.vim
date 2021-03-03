call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

call denite#custom#option('default', 'split', 'floating')

nnoremap <leader>b :Denite buffer<cr>
nnoremap <leader>f :Denite file<cr>
nnoremap <leader>rf :Denite file/rec<cr>

function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction
augroup denite_mappings
    autocmd!
    autocmd FileType denite call s:denite_settings()
augroup END

