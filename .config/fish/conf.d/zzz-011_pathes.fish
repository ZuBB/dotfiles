function add_pathes_to_PATH
    # own executables
    fish_add_path -aP ~/.local/bin
    # stuff brought by composer
    fish_add_path -aP ~/.composer/vendor/bin


    # ...
end

if status is-login
    add_pathes_to_PATH
end

