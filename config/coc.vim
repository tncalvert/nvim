let g:coc_config_home = '~/AppData/Local/nvim/coc'

let s:coc_plugins = ['coc-json', 'coc-rust-analyzer', 'coc-marketplace']

function! s:coc_install_all() abort
    execute 'CocInstall' join(s:coc_plugins)
endfunction
command! CocInstallAll call s:coc_install_all()

function! s:coc_update_all() abort
    execute 'CocUpdate'
endfunction
command! CocUpdateAll call s:coc_update_all()

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
