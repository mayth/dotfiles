#!/bin/sh

set -eu

# repositories
pyenv_repo='https://github.com/yyuu/pyenv.git'
pyenv_virtualenv_repo='https://github.com/yyuu/pyenv-virtualenv.git'
pyenv_update_repo='https://github.com/yyuu/pyenv-update.git'
pyenv_doctor_repo='https://github.com/yyuu/pyenv-doctor.git'

# directory
pyenv_root=${PYENV_ROOT:-${HOME}/.pyenv}
pyenv_plugin_dir="${pyenv_root}/plugins"

if [ -d "$pyenv_root" ] || type pyenv > /dev/null 2>&1; then
    echo "pyenv is already installed" >&2
    exit 1
fi

git clone "$pyenv_repo" "$pyenv_root"
mkdir -p "$pyenv_plugin_dir"
git clone "$pyenv_virtualenv_repo" "${pyenv_plugin_dir}/pyenv-virtualenv"
git clone "$pyenv_update_repo" "${pyenv_plugin_dir}/pyenv-update"
git clone "$pyenv_doctor_repo" "${pyenv_plugin_dir}/pyenv-doctor"

