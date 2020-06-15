set nocompatible

let g:python3_host_prog=expand('~\scoop\apps\python\current\python.exe')

let s:config_dir = expand('~/AppData/Local/nvim/config')
let s:config_files = [
        \'plugs',
        \'common',
        \'gui',
        \'filetypes',
        \'floaterm',
        \'startify',
        \'mundo',
        \'denite',
        \'choosewin',
        \'nerdtree',
        \'coc',
        \'autocorrect'
    \]

for s:file in s:config_files
    execute 'source' (s:config_dir . '/' . s:file . '.vim')
endfor

function! s:edit_config_file(file) abort
    execute 'edit' (s:config_dir . '/' . a:file . '.vim')
endfunction
command! -nargs=1 EditConfig call s:edit_config_file(<f-args>)

