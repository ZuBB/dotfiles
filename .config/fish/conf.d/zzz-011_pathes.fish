# vim: set filetype=sh : ~

function add_pathes_to_PATH
    # own executables
    fish_add_path -aP ~/.local/bin

    # ...
end

if status is-login
    add_pathes_to_PATH
end

