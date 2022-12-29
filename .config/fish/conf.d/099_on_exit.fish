#nohup echo 'hi' </dev/null >/dev/null 2>&1 &
#(nohup logout_tasks_details >/dev/null 2>&1 &) >/dev/null 2>&1

function sync_vcsh_repos
    echo "in _sync_vcsh_repos_" >> /tmp/llog
    for repo in (vcsh list | string split)
    	echo "in _sync_vcsh_repos_ with $repo" >> /tmp/llog
        vcsh run "$repo" git commit -qam "autoupdate of configs in '$repo'"
        vcsh run "$repo" git push -q
    end
end

function logout_tasks
    echo "in _logout_tasks_" >> /tmp/llog
    sync_vcsh_repos
    # ... other stuff here
end

function detach_logout_tasks
    silent_detach vcsh_logout
end

function on_exit --on-event fish_exit
    #bass source logout_tasks
    #detach_logout_tasks >/dev/null 2>&1
    #detach_logout_tasks
    vcsh_logout
end

