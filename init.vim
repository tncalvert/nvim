set nocompatible

let g:python3_host_prog=expand('~\scoop\apps\python\current\python.exe')

let s:config_dir = expand('~/AppData/Local/nvim/config')
let s:config_files = [
        \'plugs.vim',
        \'common.vim',
        \'filetypes.vim',
        \'floaterm.vim',
        \'startify.vim',
        \'mundo.vim',
        \'ale.vim',
        \'denite.vim',
        \'choosewin.vim',
        \'nerdtree.vim',
        \'autocorrect.vim'
    \]

for s:file in s:config_files
    execute 'source' (s:config_dir . '/' . s:file)
endfor

