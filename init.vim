set nocompatible

" enable python {{{

let g:python3_host_prog=expand('~\AppData\Local\Programs\Python\Python36-32\python.exe')
let g:python_host_prog='C:\Python27\python.exe'

" }}}

" plugins {{{

call plug#begin('~\AppData\Local\nvim\plugged')

"Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'install.cmd' }
"Plug 'omnisharp/omnisharp-vim'

Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'itchyny/vim-cursorword'
Plug 'jelera/vim-javascript-syntax'
Plug 'majutsushi/tagbar'
Plug 'oranget/vim-csharp'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'simnalamburt/vim-mundo'
Plug 't9md/vim-choosewin'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
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

set hidden
set nowrap
set number
set numberwidth=2
set sidescroll=8
set laststatus=2
set ruler
set title
set novisualbell
set noerrorbells
set noshowmatch " showmatch slows down OmniComplete

set tabstop=4
set expandtab
set shiftwidth=4
set shiftround
set smarttab
set autoindent

set ignorecase
set smartcase
set incsearch

" default :split and :vsplit windows to open below and right
set splitbelow
set splitright

set list
set listchars=tab:\ \ ,trail:.,extends:#,nbsp:.
set backspace=indent,eol,start
set wildignore=*.swp,*.bak,*.pyc,*.class

set history=10000 " remember 10000 commands and search history
set undolevels=10000 " use many levels of undos

set nobackup

"let g:SuperTabDefaultCompletionType='context'
"let g:SuperTabContextDefaultCompletionType="<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery=["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose=1

"let g:OmniSharp_server_type='roslyn' " use omnisharp-roslyn
"let g:OmniSharp_timeout=1 " timeout in seconds to wait for a response from OmniSharp
"set completeopt=longest,menuone,preview "don't autoselect first item in omnicomplete, show if only one item (for preview)
"let g:omnicomplete_fetch_documentation=1 " fetch full documentation during OmniComplete requests

"let g:syntastic_cs_checkers=['code_checker'] " use with omnisharp-roslyn

set updatetime=500 " wait time in ms before fetching type/symbol information

let g:fsharp_interactive_bin='C:\Program Files (x86)\Microsoft SDKs\F#\4.1\Framework\v4.0\fsi.exe'
let g:fsharp_xbuild_path='C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\MSBuild.exe'

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

nnoremap <leader>olv :execute "vsplit " . bufname("#")<cr>
nnoremap <leader>olh :execute "split " . bufname("#")<cr>

" highlight trailing spaces as error
nnoremap <silent> <leader>w :match Error /\v\s+$/<cr>
nnoremap <silent> <leader>W :match none<cr>

nmap - <Plug>(choosewin)

" start searches in very magic mode
nnoremap / /\v

vnoremap <leader>s :sort<cr>

nnoremap <leader>db :Denite buffer<cr>
nnoremap <leader>df :Denite file<cr>
nnoremap <leader>dfr :Denite file_rec<cr>

nnoremap <leader>mt :MundoToggle<cr>

noremap <leader><space> :OmniSharpGetCodeActions<cr> " contextual code actions (needs CtrlP)
"vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr> " run code actions with text selected to extract method

"" rename with dialog
"nnoremap <leader>nm :OmniSharpRename<cr>
"nnoremap <F2> :OmniSharpRename<cr>
"" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

"nnoremap <leader>rl :OmniSharpReloadSolution<cr>
"nnoremap <leader>cf :OmniSharpCodeFormat<cr>
"nnoremap <leader>th :OmniSharpHighlightTypes<cr> "add syntax highlighting for types and interfaces

" }}}

" autocmds {{{

augroup filetype_html
    autocmd!
    autocmd filetype html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
augroup END

augroup filetype_markdown
    autocmd!
    autocmd filetype markdown onoremap ih :<c-u>execute "normal! ?^[=-]\\{2,}$\r:nohlsearch\rkvg_"<cr>
    autocmd filetype markdown onoremap ah :<c-u>execute "normal! ?^[=-]\\{2,}$\r:nohlsearch\rg_vk0"<cr>
augroup END

augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
    autocmd filetype vim nnoremap <silent> <buffer> <localleader>st :source %<cr>
augroup END

augroup filetype_c
    autocmd!
    " NOTE(tim): space at the end of the following line is intentional
    autocmd filetype c nnoremap <buffer> <localleader>cn A// NOTE(tim): 
augroup END

"augroup omnisharp_commands
    "autocmd!

    "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete " set auto complete to OmniSharp
    "autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr> " initiate async build (requires vim-dispatch)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck " auto-check sytax
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation() " show type info when cursor stops moving

    "autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    "autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    "autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    "autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    "autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>

    "autocmd FileType cs nnoremap <leader>x :OmniSharpFixIssues<cr>
    "autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    "autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    "autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>

    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
"augroup END

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

