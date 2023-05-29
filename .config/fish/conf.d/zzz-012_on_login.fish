# vim: set filetype=sh : ~

function detach_login_tasks
    nohup vcsh pull -q &;
    disown
end

if status is-interactive
    detach_login_tasks >/dev/null 2>&1
end

