# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# https://bit.ly/33ZG2w6 macos 10.15 bash -> zsh 
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f ~/.bash/main ]; then
    . ~/.bash/main
fi

