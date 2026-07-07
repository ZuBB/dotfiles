# vim: set filetype=fish : ~

# vim: set filetype=fish : ~

function gt
    if test (count $argv) -gt 0
        switch $argv[1]
            case wb
                wt switch --create $argv[2..-1]
                return $status

            case wo
                wt switch $argv[2..-1]
                return $status

            case wd
                wt remove $argv[2..-1]
                return $status

            case wl
                wt list $argv[2..-1]
                return $status

            case 'w*'
                echo "Unknown gt worktree alias: $argv[1]"
                return 1
        end
    end

    if test -e ./dev/.git; and test -d ./worktrees
        command git -C ./dev $argv
    else
        command git $argv
    end
end
