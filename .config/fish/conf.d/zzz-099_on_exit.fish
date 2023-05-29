# vim: set filetype=sh : ~

function logout_tasks
    for repo in (vcsh list)
        vcsh "$repo" commit -qam "autoupdate of configs in '$repo'"
    end

    vcsh push -q
end

function detach_logout_tasks
    logout_tasks &;
    disown
end


function on_exit --on-process %self
    detach_logout_tasks
end

