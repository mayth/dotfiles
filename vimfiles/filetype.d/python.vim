function! s:python()
    setlocal expandtab
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4

    setlocal completeopt-=preview
    if g:jedi#completions_enabled
        setlocal omnifunc=jedi#completions
    endif
endfunction

augroup vimrc-python
    autocmd!
    autocmd FileType python call s:python()
    autocmd FileType python3 call s:python()
augroup END
