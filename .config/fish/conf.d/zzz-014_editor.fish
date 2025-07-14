# vim: set filetype=sh : ~

# https://github.com/mattgreen/dotfiles/commit/e066699ad1b573bf8a85bbba3056a65c3a505979
# Use nvim as editor if available
set -gx EDITOR vim
command -q nvim && set -gx EDITOR nvim

