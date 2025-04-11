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

    # Check if hostname should be overridden
    set -l display_hostname $actual_hostname
    if test "$actual_hostname" = "MJLG2DL4HFL"
        set display_hostname "phoenix"
    end

    # Disable PWD shortening by default.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    printf '%s%s@%s %s%s $ %s' (set_color $USER_HOST_COLOR) $USER \
        $display_hostname (set_color $WORKING_DIRECTORY_COLOR) (prompt_pwd) \
        (set_color normal)
end

