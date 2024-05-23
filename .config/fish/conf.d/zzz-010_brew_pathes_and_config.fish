function add_macos_brew_pathes_to_path
    # nothing fancy. just output of official command `brew shellenv`
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
    fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin";
    ! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
    ! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
end

function add_linux_brew_pathes_to_path
    # nothing fancy. just output of official command `brew shellenv`
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
    fish_add_path -gP "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin";
    ! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
    ! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;
end

function add_brew_pathes_to_path
    set -l os (uname)
    if test "$os" = Darwin
        # do things for macOS
        add_macos_brew_pathes_to_path
    else if test "$os" = Linux
        # do things for Linux
        add_linux_brew_pathes_to_path
    else
        echo "OS $os is not supported"
    end

end

if status is-login
    add_brew_pathes_to_path
end

# https://github.com/Homebrew/brew/issues/1327
set -gx HOMEBREW_NO_GITHUB_API 1

# https://github.com/Homebrew/brew/issues/1327
# https://news.ycombinator.com/item?id=36633775
set -gx HOMEBREW_NO_ANALYTICS 1

# https://computingforgeeks.com/prevent-homebrew-auto-update-on-macos/
set -gx HOMEBREW_NO_AUTO_UPDATE 1



