# vim: set filetype=sh : ~

# https://github.com/fish-shell/fish-shell/issues/10926
# https://github.com/fish-shell/fish-shell/discussions/11018
set fish_version (fish --version | string replace -r 'fish, version ' '')

if test (string sub -s 1 -l 1 $fish_version) -ge 4
   bind alt-backspace backward-kill-word
end

