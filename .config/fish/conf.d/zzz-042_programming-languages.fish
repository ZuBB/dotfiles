# JavaScript

# https://github.com/Schniz/fnm#fish-shell
# command -q fnm && fnm env --use-on-cd | source


# Python

# https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
command -q pyenv && pyenv init - | source


# Golang
if command -q go
    set -g GOBIN (go env GOBIN)
    if test -n "$GOBIN_LOCAL"
        set -x PATH $GOBIN $PATH
    end
end


# Any lang

# https://vfox.lhan.me/guides/quick-start.html#_2-hook-vfox-to-your-shell
command -q vfox && vfox activate fish | source

# mise / vfox alternative
# command -q mise && mise activate fish | source

