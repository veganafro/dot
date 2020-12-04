# set the default editor to emacs
export EDITOR='emacs -nw'

# configure android dev tools
export JAVA_HOME="$(/usr/libexec/java_home -v1.8)"
export ANDROID_HOME=~/android-sdk
export ANDROID_NDK=~/android-ndk
export ANDROID_NDK_HOME=~/android-ndk
alias adb="$ANDROID_HOME/platform-tools/adb"
alias aapt="$ANDROID_HOME/build-tools/30.0.1/aapt"
alias aapt2="$ANDROID_HOME/build-tools/30.0.1/aapt2"
alias apkanalyzer="$ANDROID_HOME/tools/bin/apkanalyzer"
alias lint="$ANDROID_HOME/tools/bin/lint"

# set up golang
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# enable brew auto-completion
source $(brew --prefix)/etc/bash_completion.d/bazel-complete.bash

# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]
	then
		echo " [${BRANCH}]"
	else
		echo ""
	fi
}

# show the time and git branch
export PS1="\T \u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# set up android dev tools auto-completion
export PATH=$JAVA_HOME/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH

# set up ruby version manager
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

