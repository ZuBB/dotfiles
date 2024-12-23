# vim: set filetype=sh : ~

function detach_login_tasks
    nohup vcsh pull -q </dev/null &>/dev/null & disown

    create_screens_dir
end

function create_screens_dir
    set -l os (uname)

    if test "$os" = Darwin
        mkdir -p /tmp/screens
#   else if test "$os" = Linux
#       add_linux_brew_pathes_to_path
    else
        echo "OS $os is not supported"
    end
end

if status is-interactive
    detach_login_tasks
end

