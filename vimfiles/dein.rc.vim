let s:dein_dir = expand(g:rc_dir . '/dein')
let s:toml = g:rc_dir . '/dein.toml'
let s:toml_lazy = g:rc_dir . '/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml, s:toml_lazy])

  call dein#load_toml(s:toml, { 'lazy': 0 })
  call dein#load_toml(s:toml_lazy, { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
