# JavaScript

# https://github.com/Schniz/fnm#fish-shell
# command -q fnm && fnm env --use-on-cd | source
command -q fnm && fnm env | source


# Python

# https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
command -q pyenv && pyenv init - | source


# Golang
if command -q go
    set -gx GOBIN $HOME/.local/bin
    set -gx GOPATH $HOME/.local/share/go
    set -gx GOCACHE $HOME/.cache/go-build
    set -gx GOMODCACHE $HOME/.cache/go-mod
    set -gx GOROOT (go env GOROOT)
    set -gx PATH $GOBIN $PATH
end


# Any lang

# https://vfox.lhan.me/guides/quick-start.html#_2-hook-vfox-to-your-shell
command -q vfox && vfox activate fish | source

# mise / vfox alternative
# command -q mise && mise activate fish | source

