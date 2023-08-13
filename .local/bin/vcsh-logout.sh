#!/usr/bin/env bash

for repo in `vcsh list`; do
    vcsh run "${repo}" git diff-index --quiet HEAD

    if [ $? -ne 0 ]
    then
        vcsh run "${repo}" git commit -qam "autoupdate of configs in '${repo}'";
    fi
done

vcsh push -q;

