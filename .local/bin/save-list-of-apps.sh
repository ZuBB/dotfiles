#!/usr/bin/env bash

OS_TYPE=$(uname -o | tr '[:upper:]' '[:lower:]')
HOST_NAME=$(hostname -s)
DEST_PATH=$HOME/.local/share/system-state/$OS_TYPE/$HOST_NAME
BREW_EXE_PATH=/opt/homebrew/bin/brew

mkdir -p $DEST_PATH

if [ "$OS_TYPE" == "darwin" ]; then
    ls -1 /Applications/ > $DEST_PATH/installed-system-apps
    ls -1 $HOME/Applications/ > $DEST_PATH/installed-user-apps
fi

if [ -e $BREW_EXE_PATH ]; then
    HOMEBREW_NO_AUTO_UPDATE=1 $BREW_EXE_PATH bundle dump -qf --brews --cask --tap --mas --file $DEST_PATH/Brewfile
fi

