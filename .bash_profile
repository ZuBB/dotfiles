if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc;
fi

# apple m1 & brew
eval "$(/opt/homebrew/bin/brew shellenv)"
