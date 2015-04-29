if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

""""" Listing of plugins and install/check them
call neobundle#begin(expand('~/.vim/bundle/'))

source ~/.vim/plugins.vim

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

""""" Basic Settings
set number
set showmode
set ruler
set cursorline
set showcmd
set showmatch
set laststatus=2
set backspace=start,eol,indent
set modeline
set modelines=3

" highlighting is very important!
syntax enable

" Searching
set ignorecase
set smartcase

" enable mouse
set mouse=a
set ttymouse=xterm2

" colorscheme
" colorscheme Tomorrow-Night
colorscheme hybrid

""""" end of script
set secure

