#!/usr/bin/env bash

OS_TYPE=$(uname -o | tr '[:upper:]' '[:lower:]')
DEST_DIR=$1

if [ "$OS_TYPE" == "darwin" ]; then
    ls -1 /Applications/ > $DEST_DIR/installed-system-apps;
    ls -1 $HOME/Applications/ > $DEST_DIR/installed-user-apps;
fi

