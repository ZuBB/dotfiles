#if [ $(uname -s) = "Darwin" ]; then
    # do_smth;
#fi

if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc;
fi

