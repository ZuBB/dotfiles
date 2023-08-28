#!/usr/bin/env bash

DEST_PATH=$HOME/.local/share/installed-apps-list/macos

mkdir -p $DEST_PATH

/opt/homebrew/bin/brew bundle dump -qf --file $DEST_PATH/Brewfile

ls -1 /Applications/ > $DEST_PATH/system-apps

ls -1 $HOME/Applications/ > $DEST_PATH/user-apps

