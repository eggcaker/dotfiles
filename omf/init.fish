# TODO: rewrite this based on fish way ??
source ~/.aliases
source ~/.fishrc.local

# bin
set -gx PATH $PATH ~/bin
set -gx ANDROID_HOME cd /usr/local/Caskroom/android-sdk/3859397,26.0.1/
set -gx ANDROID_BIN  $ANDROID_HOME/platform-tools $ANDROID_HOME/tools/
set -gx PATH $PATH $ANDROID_BIN
set -gx NODE_PATH  "/Users/eggcaker/.nodenv/versions/8.3.0/lib/node_modules"


set -gx  LC_ALL en_US.UTF-8
