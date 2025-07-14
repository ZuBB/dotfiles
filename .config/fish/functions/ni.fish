function ni -d 'automated version of \'npm init\''
    if command -sq npm-init
        command npm-init $argv
        cd $argv
    else
        echo "'npm-init' command is not found"
    end
end

