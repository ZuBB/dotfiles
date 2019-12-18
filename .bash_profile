if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc;
fi

eval "$(rbenv init -)"
