#!/bin/bash

set -euo pipefail

repo_path=$(git rev-parse --show-toplevel)
worktree_path=
branch=
worktree_paths=()
branches=()

collect_worktree() {
  if [[ -z "$worktree_path" || -z "$branch" ]]; then
    return
  fi

  worktree_paths+=("$worktree_path")
  branches+=("$branch")
}

compute_status() {
  local target_path=$1

  local staged=false
  local modified=false
  local untracked=false
  local line index_state worktree_state symbols=

  while IFS= read -r line; do
    if [[ "$line" == '??'* ]]; then
      untracked=true
      continue
    fi

    index_state=${line:0:1}
    worktree_state=${line:1:1}
    [[ "$index_state" != ' ' ]] && staged=true
    [[ "$worktree_state" != ' ' ]] && modified=true
  done < <(git -C "$target_path" status --porcelain=v1)

  $modified && symbols+='M'
  $staged && symbols+='+'
  $untracked && symbols+='?'

  printf '%s' "$symbols"
}

while IFS= read -r line || [[ -n "$line" ]]; do
  case "$line" in
    'worktree '*)
      collect_worktree
      worktree_path=${line#worktree }
      branch=
      ;;
    'branch refs/heads/'*)
      branch=${line#branch refs/heads/}
      ;;
    '')
      collect_worktree
      worktree_path=
      branch=
      ;;
  esac
done < <(git worktree list --porcelain)

collect_worktree

status_dir=$(mktemp -d "${TMPDIR:-/tmp}/wt-fast-list.XXXXXX")
trap 'rm -rf "$status_dir"' EXIT

for index in "${!worktree_paths[@]}"; do
  compute_status "${worktree_paths[$index]}" >"$status_dir/$index" &
done
wait

for index in "${!worktree_paths[@]}"; do
  symbols=$(<"$status_dir/$index")
  git -C "$repo_path" config --local \
    "worktrunk.state.${branches[$index]}.vars.quickstatus" "$symbols"
done

exec wt -C "$repo_path" list
