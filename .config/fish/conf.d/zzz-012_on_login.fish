# vim: set filetype=sh : ~

function detach_login_tasks
    nohup vcsh pull -q </dev/null &>/dev/null & disown

    mkdir -p /tmp/screens
end

if status is-interactive
    detach_login_tasks
end

