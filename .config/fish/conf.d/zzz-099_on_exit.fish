# vim: set filetype=sh : ~
# https://matrix.to/#/!YLTeaulxSDauOOxBoR:matrix.org/$1sc5KBTXkQoMgF4naB5BGeUVwtyaAu431jE5NPQmsIg?via=matrix.org&via=gitter.im&via=zwanenburg.info

function detach_logout_tasks
    #git diff-index --quiet HEAD

    #test $status -eq 0; and return 0

    #if test $status -eq 0
        #return 0
    #end

    #for repo in (vcsh list)
        #vcsh "$repo" commit -qam "autoupdate of configs in '$repo'" &>/dev/null
    #end

    # https://github.com/fish-shell/fish-shell/issues/4010#issuecomment-439721767
    # https://stackoverflow.com/questions/23898623/nohup-cant-detach-from-console
    # https://github.com/kovidgoyal/kitty/discussions/6544
    # https://unix.stackexchange.com/questions/266565/daemonize-a-process-in-shell
    # reattach-to-user-namespace nohup vcsh push -q </dev/null &>/dev/null & disown
    #reattach-to-user-namespace nohup vcsh push -q </dev/null &>/dev/null & disown
    # daemonize vcsh push -q
    # nohup vcsh push -q </dev/null &>/dev/null & disown
    # reattach-to-user-namespace nohup vcsh-logout.sh </dev/null &>/dev/null & disown
    daemonize -c $HOME $HOME/.local/bin/vcsh-logout.sh


#daemonize: illegal option -- -
#Bad option: --
#daemonize, version 1.7.8
#Usage: daemonize [OPTIONS] path [arg] ...

#OPTIONS

#-a             Append to, instead of overwriting, output files. Ignored 
#               unless -e and/or -o are specified.
#-c <dir>       Set daemon's working directory to <dir>.
#-e <stderr>    Send daemon's stderr to file <stderr>, instead of /dev/null.
#-E var=value   Pass environment setting to daemon. May appear multiple times.
#-o <stdout>    Send daemon's stdout to file <stdout>, instead of /dev/null.
#-p <pidfile>   Save PID to <pidfile>.
#-u <user>      Run daemon as user <user>. Requires invocation as root.
#-l <lockfile>  Single-instance checking using lockfile <lockfile>.
#-v             Issue verbose messages to stdout while daemonizing.
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

