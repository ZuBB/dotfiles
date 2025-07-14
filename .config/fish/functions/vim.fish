# https://github.com/mattgreen/dotfiles/commit/c395faa24de2a3e6f52cef2aec797bcc53a61466
function vim
    # Use nvim if installed, and vim otherwise.
    if command -sq nvim
        command nvim $argv
    else
        command vim $argv
    end
end
