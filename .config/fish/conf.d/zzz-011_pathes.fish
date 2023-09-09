# XDG cheat-sheet
# https://gist.github.com/roalcantara/107ba66dfa3b9d023ac9329e639bc58c

function add_pathes_to_path
    # own executables
    fish_add_path -aP ~/.local/bin
    # stuff brought by composer
    fish_add_path -aP ~/.composer/vendor/bin


    # ...
end

if status is-login
    add_pathes_to_path
end

