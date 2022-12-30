# vim: set filetype=sh : ~

# delete-or-exit
# https://stackoverflow.com/questions/39728790/bash-equivalent-bash-logout-for-fish-shell
# https://fishshell.com/docs/current/cmds/bind.html?highlight=delete+exit
# ...

function detach_logout_tasks
    silent_detach logout_tasks
end

function on_exit --on-event fish_exit
    if status is-interactive
        detach_logout_tasks >/dev/null 2>&1
    end
end

