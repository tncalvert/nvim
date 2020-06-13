set nocompatible

" enable python {{{

let g:python3_host_prog=expand('~\scoop\apps\python\current\python.exe')

" }}}

" plugins {{{

call plug#begin('~\AppData\Local\nvim\plugged')

" Enable completion using the tab key.
Plug 'ervandew/supertab'
" Provides the :Tab(ularize) command to align text.
Plug 'godlygeek/tabular'
" Underlines the all instances of the current word.
Plug 'itchyny/vim-cursorword'
" A bunch of colorschemes.
Plug 'rafi/awesome-vim-colorschemes'
" A helper for some simple comment-related activities.
Plug 'preservim/nerdcommenter'
" A file explorer.
Plug 'preservim/nerdtree'
" Provides some level of support for a lot of languages. Configuration
" for each is left to the packaged plugin.
Plug 'sheerun/vim-polyglot'
" A sort of fuzzy search plugin. Provides an interface to display information
" from various sources and operate on them. Default sources allow things
" like listing buffers or files.
Plug 'shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" A completion engine.
" NOTE: Currently not enabled.
" TODO: Investigate this more. I'm sure I'm not using this well.
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'dense-analysis/ale'
" Simple helper that displays a marker after each indentation level.
Plug 'yggdroot/indentline'

call plug#end()

" }}}

" misc {{{

filetype plugin indent on
syntax on

" }}}

" color {{{

if &t_Co >= 256 || has("gui_running")
    set background=dark
    colorscheme gruvbox
    let g:airline_theme='gruvbox'
endif

" }}}

" settings {{{

set hidden        " marks a buffer as hidden when abandoned, instead of unloading it
set nowrap        " do not wrap lines
set number        " display line numbers
set numberwidth=2 " always use at least 2 columns for line numbers
set sidescroll=16 " when scrolling off the end of the screen, adjust view by this many columns
set laststatus=2  " always show the status bar
set ruler         " show the line and column number in the status bar
set title         " set the title of the window to be the current file and path
set novisualbell  " no visual flash for error messages
set noerrorbells  " no error for error messsages
set noshowmatch   " do not show matching brackets (pretty laggy)
set noshowmode    " do not show the current mode (airline will handle that)

set tabstop=4    " tab is 4 spaces by default
set expandtab    " convert tabs to spaces
set shiftwidth=4 " shift text by 4 spaces
set shiftround   " round text shifts to the nearest multiple of shiftwidth
set smarttab     " some intelligent handling of tabs when adding or deleting
set autoindent   " when opening a new line, copy the indent from the current line

set ignorecase " default is case-insensitive searching
set smartcase  " if the search string contains capital letters, make it case-sensitive
set incsearch  " incrementally update when searching to display the current match

set splitbelow " :split should open below
set splitright " :vsplit should open to the right

set list                                        " display some normally invisible characters
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:. " display tabs, trailing spaces, line wraps, and no-break spaces
set backspace=indent,eol,start                  " backspace can move through lines
set wildignore=*.swp,*.bak,*.pyc,*.class        " wildcards to ignore when expanding globs

set history=10000    " remember 10000 commands and search history
set undolevels=10000 " use many levels of undos

set nobackup " disable file backup

" Make the Mundo window a little larger
let g:mundo_width = 60
let g:mundo_preview_height = 25

" Deoplete configuration
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('smart_case', v:true)
"call deoplete#custom#option('sources', {
    "\ '_': ['buffer']
"\})

" Denite settings
call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" ALE configuration
let g:ale_virtualtext_cursor = 1
" Enable ALE with vim-airline
let g:airline#extensions#ale#enabled = 1

" }}}

" mappings {{{

let mapleader="\<space>"
let maplocalleader="\\"

" open and source vimrc
nnoremap <silent> <leader>ev :split $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

nnoremap <silent> ./ :set hlsearch!<CR>

" map j and k to something sane
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" easier commands for switching windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" kjk to exit insert and visual mode
inoremap kjk <esc>
vnoremap kjk <esc>

" convert word to uppercase
inoremap <c-u> <esc>viwUea
nnoremap <leader><c-u> viwUe

" surround word in " and '
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" open a new split of the current window
nnoremap <leader>olv :execute "vsplit " . bufname("#")<cr>
nnoremap <leader>olh :execute "split " . bufname("#")<cr>

" highlight trailing spaces as error
nnoremap <silent> <leader>w :match Error /\v\s+$/<cr>
nnoremap <silent> <leader>W :match none<cr>

" use '-' as the trigger for the choosewin plugin
nmap - <Plug>(choosewin)

" start searches in very magic mode
nnoremap / /\v

" sort selected lines
vnoremap <leader>s :sort<cr>

" open/close NERDTree
nnoremap <leader>nt :NERDTreeToggle<cr>

" Denite key mappings
nnoremap <leader>db :Denite buffer<cr>
nnoremap <leader>df :Denite file<cr>

" Mundo key mappings
nnoremap <leader>mt :MundoToggle<cr>

" }}}

" autocmds {{{

augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
    autocmd filetype vim nnoremap <silent> <buffer> <localleader>st :source %<cr>
augroup END

" https://unix.stackexchange.com/a/383044
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Denite autocmd to configure key mappings within the Denite window
autocmd FileType denite call s:denite_settings()
function! s:denite_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

" }}}

" functions {{{

nnoremap <silent> <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

nnoremap <silent> <leader>q :call <SID>QuickfixToggle()<cr>
let s:quickfix_is_open = 0
function! s:QuickfixToggle()
    if s:quickfix_is_open
        cclose
        let s:quickfix_is_open = 0
        execute s:quickfix_return_to_window . "wincmd w"
    else
        let s:quickfix_return_to_window = winnr()
        copen
        let s:quickfix_is_open = 1
    endif
endfunction

" }}}

" autocorrect {{{

iabbrev teh the
iabbrev tehn then
iabbrev taht that
iabbrev adn and
iabbrev wehn when

" }}}

