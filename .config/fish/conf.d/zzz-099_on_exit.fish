# vim: set filetype=sh : ~

function detach_logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    # https://github.com/fish-shell/fish-shell/issues/4010#issuecomment-439721767
    nohup vcsh push -q </dev/null &>/dev/null & disown
end

function mytest
    touch "/tmp/exit-from-$argv-$(date)"
end

# function on_exit1 --on-process %self
    # mytest tmux
# end

function on_exit2 --on-event fish_exit
    # mytest term
    detach_logout_tasks
end

