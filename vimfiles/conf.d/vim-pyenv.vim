let s:hooks = neobundle#get_hooks("vim-pyenv")
function! s:hooks.on_source(bundle)
    if jedi#init_python()
        function! s:jedi_auto_force_py_version() abort
            let major_version = pyenv#python#get_internal_major_version()
            call jedi#force_py_version(major_version)
        endfunction
        augroup vim-pyenv-custom-augroup
            autocmd! *
            autocmd vim-pyenv-activate-post * call s:jedi_auto_force_py_version()
            autocmd vim-pyenv-deactivate-post * call s:jedi_auto_force_py_version()
        augroup END
    endif
endfunction
