#!/bin/sh

# repositories
ndenv_repo='https://github.com/riywo/ndenv'
node_build_repo='https://github.com/riywo/node-build.git'

# directories
ndenv_root=${NDENV_ROOT:-${HOME}/.ndenv}
ndenv_plugin_dir="${ndenv_root}/plugins"

if [ -d "$ndenv_root" ] || type ndenv > /dev/null 2>&1; then
    echo "ndenv is already installed" 1>&2
    exit 1
fi

# install
git clone "$ndenv_repo" "$ndenv_root"
mkdir -p "$ndenv_plugin_dir"
git clone "$node_build_repo" "${ndenv_plugin_dir}/node-build"
