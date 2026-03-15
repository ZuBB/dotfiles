# vim: set filetype=sh : ~

if not status is-interactive; or not status is-login
    return
end

function create_brew_aliases
    set -l brew_alias_names (
        brew alias | string match -r --groups-only '^brew alias ([^=]+)='
    )

    if not contains i $brew_alias_names
        brew alias i='install'
    end

    if not contains pdep $brew_alias_names
        brew alias pdep='deps --tree --installed $1'
    end

    if not contains rdep $brew_alias_names
        brew alias rdep='uses --recursive --installed $1'
    end
end

set -l create_aliases_def (functions create_aliases)
nohup fish --no-config -c "$create_aliases_def; create_aliases" >/dev/null 2>&1 &
disown

