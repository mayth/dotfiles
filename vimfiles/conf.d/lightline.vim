let g:lightline = {
            \ 'colorscheme': 'hybrid',
            \ 'active': {
            \   'left': [
            \       [ 'mode', 'paste' ],
            \       [ 'pyenv' ],
            \       [ 'filename' ]
            \   ],
            \   'right': [
            \       [ 'syntastic', 'lineinfo' ],
            \       [ 'percent' ],
            \       [ 'fileformat', 'fileencoding', 'filetype' ]
            \   ]
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag'
            \ },
            \ 'component_type': {
            \   'syntastic': 'error'
            \ },
            \ 'component_function': {
            \   'pyenv': 'pyenv#statusline#component',
            \   'filename': 'MyFilename'
            \ }
            \ }

function! MyModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
    let fname = expand('%:t')
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction
