#!/usr/bin/env bash

git diff-index --quiet HEAD

if [ $? -ne 0 ]
then
    echo "changes detected";
    for repo in `vcsh list`; do
        vcsh run "${repo}" git commit -qam "autoupdate of configs in '${repo}'";
    done
else
    echo "no changes detected";
fi


BRANCH_STATUS=`LANG="C" git status -sb`

echo $BRANCH_STATUS


if [[ "$BRANCH_STATUS" == *"ahead"* ]]
then
    echo "ahead in status detected";
    vcsh push -q;
else
    echo "no ahead in status detected";
fi

