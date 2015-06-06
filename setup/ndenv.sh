#!/bin/sh

# repositories
ndenv_repo='https://github.com/riywo/ndenv'
node_build_repo='https://github.com/riywo/node-build.git'

# directories
ndenv_root=${NDENV_ROOT:-${HOME}/.ndenv}
ndenv_plugin_dir="${ndenv_root}/plugins"

# install
git clone "$ndenv_repo" "$ndenv_root"
mkdir -p "$ndenv_plugin_dir"
git clone "$node_build_repo" "${ndenv_plugin_dir}/node-build"
