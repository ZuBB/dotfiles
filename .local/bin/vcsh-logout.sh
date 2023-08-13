#!/usr/bin/env bash

# phase #1

for repo in `vcsh list`; do
    vcsh run "${repo}" git diff-index --quiet HEAD

    if [ $? -ne 0 ]
    then
        echo "changes detected in '${repo}'";
        vcsh run "${repo}" git commit -qam "autoupdate of configs in '${repo}'";
    else
        echo "no changes detected '${repo}'";
    fi
done


# phase #2
#BRANCH_STATUS=`LANG="C" git status -sb`

#if [[ "$BRANCH_STATUS" == *"ahead"* ]]
#then
    #echo "ahead in status detected";
#else
    #echo "no ahead in status detected";
#fi
    vcsh push -q;

