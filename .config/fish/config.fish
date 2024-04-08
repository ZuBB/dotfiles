# https://github.com/mattgreen/dotfiles/blob/1f39e9229cb04fbb20eb5da1129c2c2885ed6bb6/fish/config.fish#L19
# Source machine-local config if it exists
set --local FISH_CONFIG_ROOT (dirname (status --current-filename))
if test -f "$FISH_CONFIG_ROOT/config.local.fish"
    source "$FISH_CONFIG_ROOT/config.local.fish"
end
