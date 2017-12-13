#!/bin/zsh

REPOS=('.org-files' '.spacemacs.d' '.dotfiles')

ssh-add ~/.ssh/gitlab_rsa
ssh-add ~/.ssh/github_rsa

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

