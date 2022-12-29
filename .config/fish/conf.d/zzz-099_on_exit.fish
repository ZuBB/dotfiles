# vim: set filetype=sh : ~

function detach_logout_tasks
    silent_detach logout_tasks
end

function on_exit --on-event fish_exit
    if status is-interactive
        detach_logout_tasks >/dev/null 2>&1
    end
end

