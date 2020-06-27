function! s:set_gui_popup() abort
    if exists('g:GuiLoaded')
        GuiPopupmenu 0
    endif
endfunction

augroup vim_startup
    autocmd!
    autocmd VimEnter * call s:set_gui_popup()
augroup END

