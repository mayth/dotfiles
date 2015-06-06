#!/bin/sh

set -eu

# repositories
rbenv_repo='https://github.com/sstephenson/rbenv.git'
ruby_build_repo='https://github.com/sstephenson/ruby-build.git'
rbenv_update_repo='https://github.com/rkh/rbenv-update.git'
rbenv_gem_rehash_repo='https://github.com/sstephenson/rbenv-gem-rehash.git'
rbenv_communal_gems_repo='git://github.com/tpope/rbenv-communal-gems.git'
rbenv_default_gems_repo='https://github.com/sstephenson/rbenv-default-gems.git'
rbenv_ctags_repo='https://github.com/tpope/rbenv-ctags.git'

rbenv_root=${RBENV_ROOT:-${HOME}/.rbenv}
rbenv_plugin_dir="${rbenv_root}/plugins"

if [ -d "${rbenv_root}" ] || type rbenv > /dev/null 2>&1; then
    echo "rbenv is already installed" 1>&2
    exit 1
fi

git clone "$rbenv_repo" "$rbenv_root"
git clone "$ruby_build_repo" "${rbenv_plugin_dir}/ruby-build"
git clone "$rbenv_update_repo" "${rbenv_plugin_dir}/rbenv-update"
git clone "$rbenv_gem_rehash_repo" "${rbenv_plugin_dir}/rbenv-gem-rehash"
git clone "$rbenv_communal_gems_repo" "${rbenv_plugin_dir}/rbenv-communal-gems"
git clone "$rbenv_default_gems_repo" "${rbenv_plugin_dir}/rbenv-default-gems"
if which ctags > /dev/null 2>&1; then
    git clone "$rbenv_ctags_repo" "${rbenv_plugin_dir}/rbenv-ctags"
else
    echo 'rbenv-ctags is skipped because ctags is not installed.' 2>&1
fi

# default gems
cat <<EOS > "${rbenv_root}/default-gems"
bundler
pry
pry-byebug
pry-stack_explorer
pry-doc
EOS
