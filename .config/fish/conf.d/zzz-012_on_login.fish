# vim: set filetype=sh : ~

function detach_login_tasks
    nohup2 vcsh pull -q
end

if status is-interactive
    detach_login_tasks
end

