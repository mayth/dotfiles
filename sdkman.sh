#!/bin/bash

curl -s "https://get.sdkman.io" | bash

INIT_SCRIPT="$HOME/.sdkman/bin/sdkman-init.sh"

if [ ! -f $INIT_SCRIPT ]; then
  echo "$INIT_SCRIPT does not exist"
  exit 1
fi
source $INIT_SCRIPT

sdk install java
sdk install scala
sdk install sbt
