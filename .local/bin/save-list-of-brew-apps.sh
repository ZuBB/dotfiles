#!/usr/bin/env bash

# TODO: this supports only arm macos+linux
BREW_EXE_PATH=/opt/homebrew/bin/brew
DEST_DIR=$1

if [ -e $BREW_EXE_PATH ]; then
    HOMEBREW_NO_AUTO_UPDATE=1 $BREW_EXE_PATH bundle dump -qf --brews --cask --tap --mas --file $DEST_DIR/Brewfile;
fi

