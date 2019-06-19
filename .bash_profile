if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc;
fi

eval "$(rbenv init -)"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
