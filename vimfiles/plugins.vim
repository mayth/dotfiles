NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'cocopon/lightline-hybrid.vim'
NeoBundle 'Shougo/neocomplete.vim'

""" Development
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

""" C++
NeoBundleLazy 'justmao945/vim-clang', {
            \ 'autoload': {
            \   'filetypes': ['cpp']
            \ }
            \ }

""" Python
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'autoload': {
            \   'filetypes': ['python', 'python3', 'djangohtml'],
            \ },
            \ 'build': {
            \   'mac': 'pip install jedi',
            \   'unix': 'pip install jedi'
            \ }
            \ }
NeoBundleLazy 'lambdalisue/vim-pyenv', {
            \ 'depends': ['davidhalter/jedi-vim'],
            \ 'autoload': {
            \   'filetypes': ['python', 'python3', 'djangohtml']
            \ }
            \ }
