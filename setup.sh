#!/bin/sh

dotfiles_dir=$(cd "$(dirname "$0")"; pwd)

function lnshome() {
    # echo "${dotfiles_dir}/$1 -> ${HOME}/$2"
    if [ ! -f "${HOME}/$2" ] && [ ! -d "${HOME}/$2" ]; then
        ln -s "${dotfiles_dir}/$1" "${HOME}/$2"
    else
        echo "${HOME}/$2 already exists"
        return 1
    fi
}

function set_git_config() {
    if ! git config --global "$1" > /dev/null 2>&1; then
        git config --global "$1" "$2"
    fi
}

function run_xenv_setup() {
    "${dotfiles_dir}/setup/$1.sh"
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
lnshome _gitignore .gitignore_global
lnshome _colorrc .colorrc

### git config
set_git_config push.default simple
set_git_config core.excludesfile "${HOME}/.gitignore_global"

### run *env setup script
run_xenv_setup rbenv
run_xenv_setup pyenv
run_xenv_setup ndenv

echo 'done. you may need to restart the shell.'
