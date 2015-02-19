if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

source ~/.vim/encode.vim

if !has('gui_running')
  set t_Co=256
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'tools\\update-dll-mingw',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak'
  \   },
  \ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
NeoBundle 'Align'
NeoBundle 'fuenor/JpFormat.vim'
NeoBundle 'Shougo/vinarise'
NeoBundle 's-yukikaze/vinarise-plugin-peanalysis'
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'ruby-matchit'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'rhysd/unite-ruby-require.vim'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'tpope/vim-rbenv'
NeoBundle 'tpope/vim-haml'
NeoBundle 'cohama/the-ocamlspot.vim'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'adimit/prolog.vim'
NeoBundle 'toyamarinyon/vim-swift'
NeoBundle 'kongo2002/fsharp-vim'
NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'editorconfig/editorconfig-vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

colorscheme Tomorrow-Night

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set number
set showmode
set ruler
set cursorline
set showcmd
set showmatch
set laststatus=2
set backspace=indent,start
noremap  
noremap!  

syntax on
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" enable modeline
set modeline
set modelines=5

set mouse=a
set ttymouse=xterm2

filetype on
autocmd FileType c,cpp,perl set cindent
autocmd FileType c,cpp setlocal ts=4 sts=4 sw=4
autocmd FileType fsharp setlocal ts=4 sts=4 sw=4

set autoindent
set backup
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,euc-jp,cp932,iso-2022-jp

" colortheme
let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night'
  \ }

""" vimshell
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

""" ref.vim
let g:ref_use_vimproc = 0
nmap ,rr :<C-u>Ref refe<Space>

let g:quickrun_config = { }
let g:quickrun_config._ = {'runner' : 'vimproc'}

" C#
let g:quickrun_config['cs'] = {
            \ 'command'  : 'dmcs',
            \ 'exec'     : ['%c %o %s -out:%s:p:r.exe', 'mono %s:p:r.exe %a', 'rm -f %s:p:r.exe'],
            \ 'tempfile' : '{tempname()}.cs',
            \ }

" RSpec
let g:quickrun_config['ruby.rspec'] = {
  \ 'command' : 'rspec',
  \ 'cmdopt'  : 'bundle exec',
  \ 'exec'    : '%o %c %s'
  \ }
augroup RSpec
  autocmd!
  autocmd BufWinEnter, BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" Swift
if has("mac")
  let g:quickrun_config['swift'] = {
  \ 'command': 'swift',
  \ 'exec': '%c %o %s'
  \}
endif

" for Python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" IL assembler
augroup ilasm
  autocmd!
  autocmd BufRead, BufNewFile *.il set filetype=ilasm
augroup END

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'
		\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
imap <expr><CR>  neocomplcache#smart_close_popup() . "<CR>" . "<Plug>DiscretionaryEnd"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
if !has("gui_running")
  let g:indent_guides_auto_colors = 0
  hi IndentGuidesOdd ctermbg=236
  hi IndentGuidesEven ctermbg=238
endif

if exists('&ambiwidth')
  set ambiwidth=double
endif
