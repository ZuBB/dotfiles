# vim: set filetype=sh : ~

function detach_login_tasks
    silent_detach login_tasks
end

if status is-login
    detach_login_tasks >/dev/null 2>&1
end

