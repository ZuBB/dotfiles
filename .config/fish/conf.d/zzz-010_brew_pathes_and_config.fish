function add_brew_pathes_to_path
    # nothing fancy. just output of official command `brew shellenv`
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
    set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
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
