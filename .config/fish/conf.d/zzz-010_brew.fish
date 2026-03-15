if status is-login
    # darwin, linux, etc
    set -l os (uname | tr '[:upper:]' '[:lower:]')
    set -l filename "zzz-010_brew.fish-$os"
    set -l dir (status dirname)

    # '.' is a workaround. see `~/.config/fish/conf.d/config.fish`
    if test -f "$dir/$filename"
        # this file should contain output of `brew shellenv`
        source "$dir/$filename"
    else
        echo "No config for $os is found"
    end
end

# https://github.com/Homebrew/brew/issues/1327
set -gx HOMEBREW_NO_GITHUB_API 1

# https://github.com/Homebrew/brew/issues/1327
# https://news.ycombinator.com/item?id=36633775
set -gx HOMEBREW_NO_ANALYTICS 1

# https://computingforgeeks.com/prevent-homebrew-auto-update-on-macos/
set -gx HOMEBREW_NO_AUTO_UPDATE 1

brew alias i='install'
brew alias pdep='deps --tree --installed $1'
brew alias rdep='uses --recursive --installed $1'

