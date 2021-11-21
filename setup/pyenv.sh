#!/bin/sh

set -eu

# repositories
pyenv_virtualenv_repo='https://github.com/pyenv/pyenv-virtualenv.git'
pyenv_doctor_repo='https://github.com/pyenv/pyenv-doctor.git'

pyenv_plugin_dir="`pyenv root`/plugins"
[ -d $pyenv_plugin_dir ] || mkdir -p $pyenv_plugin_dir

git clone "$pyenv_virtualenv_repo" "${pyenv_plugin_dir}/pyenv-virtualenv"
git clone "$pyenv_doctor_repo" "${pyenv_plugin_dir}/pyenv-doctor"

