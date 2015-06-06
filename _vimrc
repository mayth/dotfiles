if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if !has('gui_running')
    set t_Co=256
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
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" highlighting is very important!
syntax enable

" Searching
set ignorecase
set smartcase

" enable mouse
set mouse=a
set ttymouse=xterm2

" colorscheme
"colorscheme Tomorrow-Night
colorscheme hybrid

""""" plugin settings
""" define helper function
function! s:source_plugin_setting(pluginname)
    if filereadable(expand('~/.vim/conf.d/' . a:pluginname . '.vim'))
        execute 'source' expand('~/.vim/conf.d/' . a:pluginname . '.vim')
    else
        echo 'setting file for ' . a:pluginname . ' is not readble!'
    endif
endfunction

""" source plugin settings
call s:source_plugin_setting('neocomplete')
call s:source_plugin_setting('neosnippet')


""""" filetype settings
""" define helper function
function! s:source_filetype_setting(filetype)
    if filereadable(expand('~/.vim/filetype.d/' . a:filetype . '.vim'))
        execute 'source' expand('~/.vim/filetype.d/' . a:filetype . '.vim')
    else
        echo 'setting file for ' . a:filetype . ' is not readble!'
    endif
endfunction

""" source filetype settings
call s:source_filetype_setting('cpp')

""""" end of script
set secure

" vim: et ts=4 sts=0 sw=4
