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
NeoBundleLazy 'thinca/vim-quickrun', {
            \ 'autoload': {
            \   'mappings': [['nxo', '<Plug>(quickrun)']]
            \ }
            \ }
NeoBundle 'vim-scripts/sudo.vim'

""" Editing
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/YankRing.vim'

""" Development
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 'majutsushi/tagbar', {
    \ 'autoload': {
    \   'commands': ['TagbarToggle']
    \ }
    \ }
" git
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {
            \ 'depends': ['tpope/vim-fugitive'],
            \ 'autoload': {
            \   'commands': ['Gitv']
            \ }
            \ }

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
