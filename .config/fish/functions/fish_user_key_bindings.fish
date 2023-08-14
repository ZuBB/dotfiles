function fish_user_key_bindings
  bind \cw backward-kill-bigword
  # https://github.com/fish-shell/fish-shell/issues/2904
  #bind \cc 'echo; commandline | cat; commandline ""; commandline -f repaint'
end

