#!/usr/bin/env bash

ARCH=$(uname -m)
OS_TYPE=$(uname -o | tr '[:upper:]' '[:lower:]')
HOST_NAME=$(hostname -s)

BASE_DEST_PATH=$HOME/.local/share/system-state/
COMMON_DEST_PATH=$HOME/.local/share/system-state/$ARCH/$OS_TYPE/$HOST_NAME
CUR_DEST_PATH=$COMMON_DEST_PATH/current
AT_DEST_PATH=$COMMON_DEST_PATH/all-time

mkdir -p $COMMON_DEST_PATH/{current,all-time}


# CURRENT DATA

if [ "$OS_TYPE" == "darwin" ]; then
    ls -1 /Applications/ > $CUR_DEST_PATH/installed-system-apps;
    ls -1 $HOME/Applications/ > $CUR_DEST_PATH/installed-user-apps;
fi


if [ -e $HOME/.local/bin/save-list-of-brew-apps.sh ]; then
    $HOME/.local/bin/save-list-of-brew-apps.sh $CUR_DEST_PATH;
fi

# ALL-TIME DATA

#{ ls -1 /Applications/; cat $AT_DEST_PATH/installed-system-apps } | sort -u > $AT_DEST_PATH/installed-system-apps;
