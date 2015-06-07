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

" Reset autocmd
augroup MyAutoCmd
    autocmd!
augroup END

""""" Basic Settings
" highlighting is very important!
syntax enable

""" Showing
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

""" bell
set t_vb=
set novisualbell

""" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

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

""""" Key bindings
" <Esc><Esc> to disable highlighting search result
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" change j,k behavior for wrapped text
nnoremap j gj
nnoremap k gk
" <Tab> to jump matched pair
nnoremap <Tab> %
vnoremap <Tab> %
" directional keys to change window size
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" q to close help/quickfix window
autocmd MyAutoCmd FileType help,qf,quickrun nnoremap <buffer> q <C-w>c

" enable mouse
set mouse=a
set ttymouse=xterm2

" colorscheme
"colorscheme Tomorrow-Night
colorscheme hybrid

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
call s:source_filetype_setting('python')


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
call s:source_plugin_setting('lightline')
call s:source_plugin_setting('neocomplete')
call s:source_plugin_setting('vim-quickrun')
call s:source_plugin_setting('JpFormat')
call s:source_plugin_setting('syntastic')
call s:source_plugin_setting('neosnippet')
call s:source_plugin_setting('vim-indent-guides')
call s:source_plugin_setting('vim-pyenv')

""""" end of script
set secure

" vim: et ts=4 sts=0 sw=4
