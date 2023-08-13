# vim: set filetype=sh : ~
# https://matrix.to/#/!YLTeaulxSDauOOxBoR:matrix.org/$1sc5KBTXkQoMgF4naB5BGeUVwtyaAu431jE5NPQmsIg?via=matrix.org&via=gitter.im&via=zwanenburg.info

function detach_logout_tasks
    # https://github.com/fish-shell/fish-shell/issues/4010#issuecomment-439721767
    # https://stackoverflow.com/questions/23898623/nohup-cant-detach-from-console
    # https://github.com/kovidgoyal/kitty/discussions/6544
    # https://unix.stackexchange.com/questions/266565/daemonize-a-process-in-shell
    # reattach-to-user-namespace nohup vcsh push -q </dev/null &>/dev/null & disown
    daemonize -c $HOME $HOME/.local/bin/vcsh-logout.sh
end

function mytest
    touch "/tmp/hello-from-'$argv'-$(date)"
end

# function on_exit1 --on-process-exit %self
#     mytest on-process-exit
# end

# function on_exit2 --on-process %self
#     mytest on-process
# end

function on_exit3 --on-event fish_exit
    # mytest fish_exit_event
    detach_logout_tasks
end

