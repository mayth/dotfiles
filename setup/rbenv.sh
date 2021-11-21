#!/bin/sh

set -eu

# repositories
rbenv_update_repo='https://github.com/rkh/rbenv-update.git'
rbenv_default_gems_repo='https://github.com/rbenv/rbenv-default-gems.git'
rbenv_ctags_repo='https://github.com/tpope/rbenv-ctags.git'

rbenv_plugin_dir="$(rbenv root)/plugins"

if command -v rbenv > /dev/null; then
    echo "rbenv is already installed" 1>&2
    exit 1
fi

git clone "$rbenv_update_repo" "${rbenv_plugin_dir}/rbenv-update"
git clone "$rbenv_default_gems_repo" "${rbenv_plugin_dir}/rbenv-default-gems"
if which ctags > /dev/null 2>&1; then
    git clone "$rbenv_ctags_repo" "${rbenv_plugin_dir}/rbenv-ctags"
else
    echo 'rbenv-ctags is skipped because ctags is not installed.' 2>&1
fi

# default gems
cat <<EOS > "$(rbenv root)/default-gems"
EOS
