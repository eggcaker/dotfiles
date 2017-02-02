#!/bin/zsh

function pull_changes() {
  echo "pull files of $1 ... "
  cd "$1";
  #git-up
  git pull origin `git branch|grep '\*'| awk '{print $2}'`;
  echo "--------------------------------------------------------------------------------"
}

pull_changes ~/.spacemacs.d;
pull_changes ~/.org-files;
pull_changes ~/.zprezto;
#pull_changes ~/.task;

if [[ "`uname`" == "Linux" ]]; then 
  # nothing to start for now
else # Mac os 
  open /Applications/QQ.app
  open /Applications/Emacs.app
  open /Applications/Google\ Chrome\ Stable.app
fi 
echo "Everythings done! start work!!!"

