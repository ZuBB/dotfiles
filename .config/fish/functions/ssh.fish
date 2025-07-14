# https://github.com/fish-shell/fish-shell/pull/5981
function ssh -d 'kitty compatible ssh command'
    switch $TERM
    case xterm-kitty
        kitty +kitten ssh $argv
    case "*"
        command ssh $argv
    end
end
