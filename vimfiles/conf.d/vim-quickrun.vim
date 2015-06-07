nmap <Leader>r <Plug>(quickrun)
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

let s:hooks = neobundle#get_hooks('vim-quickrun')
function! s:hooks.on_source(bundle)
    let g:quickrun_config = {
        \ '_': {
        \   'runner': 'vimproc',
        \   'runner/vimproc/updatetime': 100
        \ }
        \ }
endfunction
