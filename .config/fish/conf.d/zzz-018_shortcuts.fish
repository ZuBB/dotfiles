# vim: set filetype=sh : ~

#set version (fish --version | string split ' ' | string take 1)

#if test (string sub -s 1 -l 1 $version) -ge 4
   #bind alt-backspace backward-kill-word
#end

#   set fish_version (fish --version | string split ' ' | string join '' | string replace -r '.*version ' '')

#   if test (string sub -s 1 -l 1 $fish_version) -ge 4
#      bind alt-backspace backward-kill-word
#   end

set fish_version (fish --version | string replace -r 'fish, version ' '')

if test (string sub -s 1 -l 1 $fish_version) -ge 4
   bind alt-backspace backward-kill-word
end
