# vim: set filetype=sh : ~

# Define $PAGER global and exported,
# so this is like ``export PAGER=less``
set -gx PAGER less

# set EDITOR
set -gx EDITOR nvim

# https://github.com/Homebrew/brew/issues/1327
set -gx HOMEBREW_NO_GITHUB_API 1

# https://github.com/Homebrew/brew/issues/1327
# https://news.ycombinator.com/item?id=36633775
set -gx HOMEBREW_NO_ANALYTICS 1

