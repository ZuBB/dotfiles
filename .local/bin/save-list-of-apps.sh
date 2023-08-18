#!/usr/bin/env bash

brew leaves -r > $HOME/.local/share/apps/brew-apps

brew list --cask -1 > $HOME/.local/share/apps/casks-apps

mas list > $HOME/.local/share/apps/appstore-apps

ls -1 /Applications/ > $HOME/.local/share/apps/system-apps

ls -1 $HOME/Applications/ > $HOME/.local/share/apps/user-apps

