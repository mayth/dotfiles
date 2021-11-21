#!/bin/sh

if ! command -v anyenv > /dev/null; then
    echo 'anyenv does not exist'
    exit 1
fi

anyenv install --init

anyenv install pyenv
anyenv install nodenv
anyenv install rbenv

# plugins
plugin_dir="$(anyenv root)/plugins"
[ ! -d $plugin_dir ] && mkdir -p $plugin_dir

git clone https://github.com/znz/anyenv-update.git $plugin_dir/anyenv-update

