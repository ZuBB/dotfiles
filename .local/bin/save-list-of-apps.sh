#!/usr/bin/env bash

DEST_PATH=$HOME/.local/share/installed-apps-list

mkdir -p $DEST_PATH

brew leaves -r > $DEST_PATH/brew-apps

brew list --cask -1 > $DEST_PATH/casks-apps

mas list > $DEST_PATH/appstore-apps

ls -1 /Applications/ > $DEST_PATH/system-apps

ls -1 $HOME/Applications/ > $DEST_PATH/user-apps

