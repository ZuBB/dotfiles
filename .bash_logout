# vim: set filetype=sh : ~
# ~/.bash_logout: executed by bash(1) when login shell exits.

call_do_logout_tasks () {
    do_logout_tasks;
}

trap call_do_logout_tasks EXIT

