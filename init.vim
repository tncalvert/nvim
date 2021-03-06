set nocompatible

let s:config_dir = expand('~/AppData/Local/nvim/config')
let s:config_files = [
        \'plugs',
        \'common',
        \'gui',
        \'filetypes',
        \'indentline',
        \'floaterm',
        \'startify',
        \'mundo',
        \'fzf',
        \'choosewin',
        \'nerdtree',
        \'autocorrect',
        \'ale',
        \'overrides'
    \]

for s:file in s:config_files
    execute 'source' (s:config_dir . '/' . s:file . '.vim')
endfor

function! s:edit_config_file(file) abort
    execute 'edit' (s:config_dir . '/' . a:file . '.vim')
endfunction
command! -nargs=1 EditConfig call s:edit_config_file(<f-args>)

