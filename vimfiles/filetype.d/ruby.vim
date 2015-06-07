function! s:ruby()
    setlocal expandtab
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction

augroup vimrc-ruby
    autocmd!
    autocmd FileType ruby call s:ruby()
augroup END
