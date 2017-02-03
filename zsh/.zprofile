if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

typeset -gU cdpath fpath mailpath path
path=(
  /usr/local/{bin,sbin}
  $path
)

export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

export PATH=~/.bin:$PATH
export PATH=~/.n/bin:$PATH

export PATH=~/.dotfiles/plugins:$PATH
export PATH=~/.dotfiles/bin:$PATH;

# added some bins from source compiled
export PATH=~/src/apps/bin:$PATH
export PATH=/usr/local/vert.x/bin:$PATH
export PATH=/usr/local/infer-osx-v0.1.0/infer/infer/bin:$PATH
export PATH=~/src/apps/stetho/scripts:$PATH
export PATH=/usr/local/Cellar/coreutils/8.23_1/bin:$PATH
export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="/usr/local/opt/android-sdk/platform-tools:$PATH"
export PATH="/usr/local/opt/android-sdk/tools/proguard/bin:$PATH"
export PATH="$N_PREFIX/bin:$PATH"
export PATH="/Users/eggcaker/.go/bin:$PATH"
export NODE_PATH="$HOME/.n/lib/node_modules:$NODE_PATH"
export PATH="~/.bin/:$PATH"
export PATH="${NPM_PACKAGES}/bin:${PATH}"
export PATH="/usr/local/sbin:$PATH"
export PATH="$MAVEN_HOME/bin:$PATH"
export PATH=$HOME"/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=$ANDROID_HOME/build-tools/24.0.3:$ANROID_HOME/platform-tools:$PATH
export GOPATH=~/.go

# Node
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="${NPM_PACKAGES}/lib/node_modules:${NODE_PATH}"
export PATH="${NPM_PACKAGES}/bin:${PATH}"

# Paths
export MAVEN_HOME="/development/tools/maven"
export PATH="/usr/local/sbin:$PATH"
export PATH="$MAVEN_HOME/bin:$PATH"
export PATH=$HOME"/bin:$PATH"
export PATH="/usr/local/bin:$PATH"


# Project
export PACER_SERVER="~/src/work/mandian_server"
