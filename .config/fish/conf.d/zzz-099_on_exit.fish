# vim: set filetype=sh : ~

function detach_logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    #nohup vcsh push -q &>/dev/null & disown
    nohup vcsh push -q </dev/null &>/dev/null & disown
end

# https://github.com/fish-shell/fish-shell/issues/4010#issuecomment-439721767
# function nohup2
#    command nohup $argv </dev/null >/dev/null 2>&1 & disown
# end

function on_exit --on-process %self
    #detach_logout_tasks
end

