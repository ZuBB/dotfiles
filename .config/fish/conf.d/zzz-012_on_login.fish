# vim: set filetype=sh : ~

function detach_login_tasks
    #nohup vcsh pull -q &>/dev/null &
    command nohup vcsh pull -q </dev/null &>/dev/null & disown
end

if status is-interactive
    detach_login_tasks
end

