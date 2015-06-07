let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if exists('g:lightline')
    let g:syntastic_mode_map = { 'mode': 'passive' }
    augroup AutoSyntastic
        autocmd!
        autocmd BufWritePost * call s:syntastic()
    augroup END
    function! s:syntastic()
        SyntasticCheck
        call lightline#update()
    endfunction
endif
