# vim: set filetype=sh : ~

function detach_logout_tasks
    silent_detach logout_tasks
end

function on_exit --on-process %self
    detach_logout_tasks
end
