#!/bin/sh

dotfiles_dir=$(cd "$(dirname "$0")"; pwd)

function lnshome() {
    # echo "${dotfiles_dir}/$1 -> ${HOME}/$2"
    if [ ! -f "${HOME}/$2" ] && [ ! -d "${HOME}/$2" ]; then
        ln -s "${dotfiles_dir}/$1" "${HOME}/$2"
    else
        echo "${HOME}/$2 already exists"
    fi
}

### init submodule
(cd "${dotfiles_dir}"; git submodule update --init)

### create symbolic link to $HOME
lnshome _zshrc .zshrc
lnshome zshfiles .zsh
lnshome _vimrc .vimrc
lnshome vimfiles .vim
lnshome _tmux.conf .tmux.conf
lnshome _screenrc .screenrc

### run *env setup script
setup/rbenv.sh
setup/pyenv.sh
setup/ndenv.sh
