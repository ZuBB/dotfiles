# vim: set filetype=fish : ~

function cd
    if test (count $argv) -eq 1
        set -l target $argv[1]

        if test -f $target
            builtin cd (path dirname $target)
            return $status
        end
    end

    builtin cd $argv
end

