#!/bin/sh

set -ue

dotfiles_dir=$(cd "$(dirname "$0")"; pwd)
#setup/rbenv.sh
#setup/pyenv.sh
#setup/ndenv.sh

ln -s "${dotfiles_dir}/_zshrc" "${HOME}/.zshrc"
ln -s "${dotfiles_dir}/zshfiles" "${HOME}/.zsh"
ln -s "${dotfiles_dir}/_vimrc" "${HOME}/.vimrc"
ln -s "${dotfiles_dir}/vimfiles" "${HOME}/.vim"

