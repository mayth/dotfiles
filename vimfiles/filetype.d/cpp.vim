function! s:cpp()
    setlocal path+=/usr/local/include

    setlocal expandtab
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4

    setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
    autocmd!
    autocmd FileType cpp call s:cpp()
augroup END

let $CPP_STDLIB = '/usr/include/c++/4.2.1'
augroup vimrc-set_filetype_cpp
    autocmd!
    autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END
