call plug#begin('~\AppData\Local\nvim\plugged')

"
" General plugins
"

" Provides linting and code analysis. Can be configured to use LSP.
"Plug 'dense-analysis/ale'
" Some json formatting
Plug 'elzr/vim-json'
" Provides the :Tab(ularize) command to align text.
Plug 'godlygeek/tabular'
" Underlines the all instances of the current word.
Plug 'itchyny/vim-cursorword'
" Provides a simple startup screen that provides access to recent files.
Plug 'mhinz/vim-startify'
" Intellisense and LSP support.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" A helper for some simple comment-related activities.
Plug 'preservim/nerdcommenter'
" A file explorer.
Plug 'preservim/nerdtree'
" A bunch of colorschemes.
Plug 'rafi/awesome-vim-colorschemes'
" A sort of fuzzy search plugin. Provides an interface to display information
" from various sources and operate on them. Default sources allow things
" like listing buffers or files.
Plug 'shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" A visualization of the undo tree.
Plug 'simnalamburt/vim-mundo'
" Small helper that allows jumping between windows.
Plug 't9md/vim-choosewin'
" Provides some advanced functionality for working with 'surrounding' text
" objects.
Plug 'tpope/vim-surround'
" Provides a nicer modeline, plus some themes.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Provides support for a popup terminal.
Plug 'voldikss/vim-floaterm'
" Simple helper that displays a marker after each indentation level.
Plug 'yggdroot/indentline'

"
" Language plugins
"

Plug 'rust-lang/rust.vim'

call plug#end()
