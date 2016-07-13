if &compatible
    set nocompatible
endif

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

augroup MyAutoCmd
    autocmd!
augroup END

""" path config
let g:rc_dir = expand('~/.vim')

""" setup dein
execute 'source' expand(g:rc_dir . '/dein.rc.vim')

""""" Basic Settings
syntax enable

""" Showing
" colorscheme
set background=dark " hybrid is "dark" theme
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

" enable mouse
set mouse=a
set ttymouse=xterm2

set secure

" vim: et ts=4 sts=0 sw=4
