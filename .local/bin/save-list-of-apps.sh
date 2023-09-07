#!/usr/bin/env bash

SYSTEM_TYPE=$(uname -o | tr '[:upper:]' '[:lower:]')
HOST_NAME=$(hostname -s)
DEST_PATH=$HOME/.local/share/system-state/$SYSTEM/$HOST_NAME

mkdir -p $DEST_PATH

if [ -e /opt/homebrew/bin/brew ]; then
    HOMEBREW_NO_AUTO_UPDATE=1 /opt/homebrew/bin/brew bundle dump -qf --brews --cask --tap --mas --file $DEST_PATH/Brewfile
fi

if [ "$SYSTEM_TYPE" == "Darwin" ]; then
    ls -1 /Applications/ > $DEST_PATH/installed-system-apps
    ls -1 $HOME/Applications/ > $DEST_PATH/installed-user-apps
fi

