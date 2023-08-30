#!/usr/bin/env bash

SYSTEM=$(uname -o)
SYSTEM_NAME="$(hostname)-$SYSTEM"
DEST_PATH=$HOME/.local/share/system-state/$SYSTEM_NAME/installed-apps

mkdir -p $DEST_PATH

if [ -e /opt/homebrew/bin/brew ]; then
    /opt/homebrew/bin/brew bundle dump -qf --brews --cask --tap --mas --file $DEST_PATH/Brewfile
fi

if [ "$SYSTEM" == "Darwin" ]; then
    ls -1 /Applications/ > $DEST_PATH/system-apps
    ls -1 $HOME/Applications/ > $DEST_PATH/user-apps
fi

