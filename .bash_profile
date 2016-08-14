if [ $(uname -s) != "Darwin" ]; then
        exit 0;
fi

if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc;
fi

