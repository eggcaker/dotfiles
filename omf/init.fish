# TODO: rewrite this based on fish way ??
source ~/.aliases
source ~/.fishrc.local

# bin


set -gx PATH $PATH ~/bin
set -gx PATH $PATH ~/.roswell/bin
set -gx PATH $PATH ~/.dotfiles/commands/elbin
set -gx PATH $PATH /Users/eggcaker/Library/Python/3.6/bin
set -gx ANDROID_SDK_ROOT /usr/local/share/android-sdk
set -gx ANDROID_HOME /usr/local/share/android-sdk/
set -gx ANDROID_BIN  $ANDROID_HOME/platform-tools $ANDROID_HOME/tools/
set -gx PATH $PATH $ANDROID_BIN
set -gx NODE_PATH "/usr/local/lib/node_modules"

set -gx  LC_ALL en_US.UTF-8
