#!/usr/bin/env bash

OS_TYPE=$(uname -o | tr '[:upper:]' '[:lower:]')
HOST_NAME=$(hostname -s)

BREW_EXE_PATH=/opt/homebrew/bin/brew

COMMON_DEST_PATH=$HOME/.local/share/system-state/$OS_TYPE/$HOST_NAME
CUR_DEST_PATH=$COMMON_DEST_PATH/current
AT_DEST_PATH=$COMMON_DEST_PATH/all-time

mkdir -p $COMMON_DEST_PATH/{current,all-time}


# CURRENT DATA

if [ "$OS_TYPE" == "darwin" ]; then
    ls -1 /Applications/ > $CUR_DEST_PATH/installed-system-apps;
    ls -1 $HOME/Applications/ > $CUR_DEST_PATH/installed-user-apps;
fi

if [ -e $BREW_EXE_PATH ]; then
    HOMEBREW_NO_AUTO_UPDATE=1 $BREW_EXE_PATH bundle dump -qf --brews --cask --tap --mas --file $CUR_DEST_PATH/Brewfile;
fi

# ALL-TIME DATA

#{ ls -1 /Applications/; cat $AT_DEST_PATH/installed-system-apps } | sort -u > $AT_DEST_PATH/installed-system-apps;
