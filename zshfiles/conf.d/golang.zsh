#
# configuration for Go language
#

if [ -z $GOPATH ]; then
  if [ -d $HOME/go ]; then
    # the first selection: example in official instruction
    GOPATH=$HOME/go
  else
    # my ordinal directory structure
    GOPATH=$HOME/devel
  fi
  export GOPATH
fi

if [[ -z $GOROOT ]]; then
  if [ -d /usr/local/opt/go ]; then
    # Homebrew installs golang into /usr/local/opt/go
    GOROOT=/usr/local/opt/go/libexec
  elif [ -d /usr/local/go ]; then
    # official install instruction
    GOROOT=/usr/local/go
  fi
  export GOROOT
fi

# add paths to golang package binaries
path=($path $GOROOT/bin $GOPATH/bin)

# vim: et ts=2 sts=0 sw=2 ft=zsh
