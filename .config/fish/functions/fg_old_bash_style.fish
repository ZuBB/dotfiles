# https://github.com/fish-shell/fish-shell/issues/5019#issuecomment-684034208
function fg -a id
  builtin fg (__fish_expand_pid_args %$id)
end
