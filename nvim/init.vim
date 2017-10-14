if &compatible
    set nocompatible
endif

augroup MyAutoCmd
    autocmd!
augroup END

""" base path
let g:rc_dir = expand('$XDG_CONFIG_HOME/nvim')

""" init dein
execute 'source' expand(g:rc_dir . '/dein_init.vim')

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

let g:hybrid_custom_term_color = 1
let g:hybrid_reduced_contrast = 1
set background=dark   " hybrid is a dark background theme
colorscheme hybrid

" options
set number
set noshowmode  " lightline will do this
set ruler
set cursorline
set showcmd
set laststatus=2
set modeline
set modelines=3
set showmatch
set matchtime=2
set wrap
set textwidth=0
set colorcolumn=80
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

""" Editing
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set infercase
set backspace=start,eol,indent
set nowritebackup
set nobackup
set noswapfile

set secure

" vim: et ts=4 sts=0 sw=4
