# vim: set filetype=sh : ~
# test 1 2 3

function detach_logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    # https://github.com/fish-shell/fish-shell/issues/4010#issuecomment-439721767
    # nohup vcsh push -q </dev/null &>/dev/null & disown
    nohup vcsh push -q </dev/null &>"/tmp/hello-from-error-$(date)" & disown
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

