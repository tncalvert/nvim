filetype plugin indent on
syntax on

if &t_Co >= 256 || has("gui_running")
    set background=dark
    colorscheme gruvbox
    let g:airline_theme='gruvbox'
endif

set hidden        " marks a buffer as hidden when abandoned, instead of unloading it
set nowrap        " do not wrap lines
set number        " display line numbers
set numberwidth=2 " always use at least 2 columns for line numbers
set scrolloff=8   " when scrolling off the bottom/top of the screen adjust view by this many rows
set sidescroll=8  " when scrolling off the end of the screen, adjust view by this many columns
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

set list                                                           " display some normally invisible characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:» " configure display of invisible characters
set backspace=indent,eol,start                                     " backspace can move through lines
set wildignore=*.swp,*.bak,*.pyc,*.class                           " wildcards to ignore when expanding globs

set history=10000    " remember 10000 commands and search history
set undolevels=10000 " use many levels of undos

set nobackup " disable file backup

set clipboard=unnamedplus " use the system clipboard for default paste/yank

set shortmess+=c " don't display completion messages

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

" highlight trailing spaces as error
nnoremap <silent> <leader>se :match Error /\v\s+$/<cr>
nnoremap <silent> <leader>sE :match none<cr>

" mappings for terminal
tnoremap <Esc> <C-\><C-n>

" start searches in very magic mode
nnoremap / /\v

augroup vim_startup
    autocmd!
    autocmd VimEnter * call s:set_default_working_dir()
augroup END
function! s:set_default_working_dir() abort
    let l:files = globpath('.', '*', 0, 1)
    if index(l:files, '.\nvim.exe') >= 0 || index(l:files, './nvim') >= 0
        execute 'cd ~'
    end
endfunction

augroup file_reload
    autocmd!
    " https://unix.stackexchange.com/a/383044
    " Triger `autoread` when files changes on disk
    " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
    " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    " Notification after file change
    " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
    autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END

nnoremap <silent> <leader>tf :call <SID>FoldColumnToggle()<cr>
function! s:FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction

nnoremap <silent> <leader>q :call <SID>QuickfixToggle()<cr>
function! s:QuickfixToggle()
    if get(getqflist({'winid':0}), 'winid', 0)
        cclose
    else
        copen
    endif
endfunction

nnoremap <silent> <leader>l :call <SID>LocationListToggle()<cr>
function! s:LocationListToggle()
    if get(getloclist(0, {'winid':0}), 'winid', 0)
        lclose
    else
        lopen
    endif
endfunction

