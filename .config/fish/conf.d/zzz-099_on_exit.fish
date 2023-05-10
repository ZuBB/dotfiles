# vim: set filetype=sh : ~

# delete-or-exit
# https://stackoverflow.com/questions/39728790/bash-equivalent-bash-logout-for-fish-shell
# https://fishshell.com/docs/current/cmds/bind.html?highlight=delete+exit
# ...

function detach_logout_tasks
    silent_detach logout_tasks
end

# function on_exit --on-process-exit $fish_pid
#     if status is-interactive
# 	#detach_logout_tasks >/dev/null 2>&1
# 	touch /tmp/on_exit_fish_($fish_pid)
#     end
# end

function on_exit --on-process %self
    detach_logout_tasks
end
