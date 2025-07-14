function fish_prompt -d "Write out the prompt"
    # Gentoo colors
    set -l WORKING_DIRECTORY_COLOR 6870FF
    set -l NON_ROOT_USER_HOST_COLOR 5FFA68
    set -l ROOT_USER_HOST_COLOR FF4147

    if fish_is_root_user
        set -f USER_HOST_COLOR $ROOT_USER_HOST_COLOR
    else
        set -f USER_HOST_COLOR $NON_ROOT_USER_HOST_COLOR
    end

    # Get the actual hostname
    set -l actual_hostname (prompt_hostname)
    set -l display_hostname $actual_hostname

    # Load override logic if available
    set -l override_file ~/.config/fish/functions/hostname_override.fish
    if test -f $override_file
        source $override_file
        set -l maybe_override (hostname_override $actual_hostname)
        if test -n "$maybe_override"
            set display_hostname $maybe_override
        end
    end

    # Disable PWD shortening by default
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    printf '%s%s@%s %s%s $ %s' (set_color $USER_HOST_COLOR) $USER \
        $display_hostname (set_color $WORKING_DIRECTORY_COLOR) (prompt_pwd) \
        (set_color normal)
end

