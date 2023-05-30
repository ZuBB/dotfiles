# vim: set filetype=sh : ~

function detach_logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    #nohup vcsh push -q </dev/null &>/dev/null & disown
    nohup vcsh push -q &>/dev/null &
end

# https://github.com/fish-shell/fish-shell/issues/4010#issuecomment-439721767
# function nohup2
#    command nohup $argv </dev/null >/dev/null 2>&1 & disown
# end

function mytest
    touch "/tmp/exit-from-$argv-$(date)"
end

# function on_exit1 --on-process %self
    #touch "/tmp/exit-from-tmux-$(date)"
    # mytest tmux
# end

function on_exit2 --on-event fish_exit
    #touch "/tmp/exit-from-term-$(date)"
    #mytest term
    detach_logout_tasks
end
