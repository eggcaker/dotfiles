#!/bin/zsh
# Add org file changes to the repository
#
# ssh key
#. ~/.keychain/mac-sh

REPOS=('.org-files' '.spacemacs.d' '.dotfiles')

for REPO in $REPOS; do
    echo "Repository: $REPO"
    cd /Users/eggcaker/$REPO
    #Remove deleted files
    git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
    # Add new files
    git add . >/dev/null 2>&1
    git commit -m "$(date +'%Y-%m-%d') auto commit" -a
    git push origin master
done

