# vim: set filetype=sh : ~

function detach_logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    nohup vcsh push -q &;
end


function on_exit --on-process %self
    detach_logout_tasks >/dev/null 2>&1
end

