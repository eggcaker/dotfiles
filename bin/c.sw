#!/usr/bin/env zsh

function pull_changes() {
  echo "pull files of $1 ... "
  cd "$1";
  #git-up
  git pull origin `git branch|grep '\*'| awk '{print $2}'`;
  echo "--------------------------------------------------------------------------------"
}


ssh-add ~/.ssh/*_rsa

pull_changes ~/.spacemacs.d;
pull_changes ~/.doom.d;
pull_changes ~/.org-notes;
pull_changes ~/.dotfiles;
#pull_changes ~/.org-files;
