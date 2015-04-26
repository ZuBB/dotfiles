# vim: set filetype=sh : ~
# ~/.bash_logout: executed by bash(1) when login shell exits.

if [ -f ~/.local/bin/logout_tasks ]; then
    ~/.local/bin/logout_tasks
fi

