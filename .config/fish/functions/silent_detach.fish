function silent_detach
    nohup $argv </dev/null >/dev/null 2>&1 &
end

