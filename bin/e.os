#!/bin/zsh
# Add org file changes to the repository
#
# ssh key
#. ~/.keychain/mac-sh

REPOS=('.org-files' '.spacemacs.d' '.ledger' '.beancount')

for REPO in $REPOS; do
    echo "Repository: $REPO"
    cd ~/$REPO
    #Remove deleted files
    git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
    # Add new files
    git add . >/dev/null 2>&1
    git commit -m "$(date) auto commit"
    git push origin master
done

