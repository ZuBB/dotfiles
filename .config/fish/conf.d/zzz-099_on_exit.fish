# vim: set filetype=sh : ~

function detach_logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    nohup vcsh push -q &
end

function nohup2
    command nohup $argv </dev/null >/dev/null 2>&1 & disown
end

function on_exit --on-process %self
    #nohup2 detach_logout_tasks >/dev/null 2>&1
    #nohup2 detach_logout_tasks
    nohup2 logout_tasks
end

