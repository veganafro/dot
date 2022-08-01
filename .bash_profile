# set the default editor to emacs
export EDITOR='emacs -nw'

# configure android dev tools
export JAVA_HOME=$(/usr/libexec/java_home -v1.11)
export ANDROID_HOME=~/android-sdk
export ANDROID_SDK_ROOT=~/android-sdk
export ANDROID_NDK=$ANDROID_HOME/ndk/21.4.7075529
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/21.4.7075529

# configure jdk related flags
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

# enable opening intellij from the command line
function idea() {
    open -na "IntelliJ IDEA CE.app" --args "$@"
}

function android_studio() {
    open -na "Android Studio.app" --args "$@"
}

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

# set up google cloud cli bash completion
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"

# show the time and git branch
export PS1="\T \u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# set up android dev tools auto-completion
export PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$PATH

# set up brew related paths
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# configure jdk related paths
export PATH=/usr/local/opt/openjdk@11/bin:$PATH

# set up golang
export GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH

# set up kubectl auto completion
echo "source <(kubectl completion bash)"

# set up ruby version manager
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# set up python version manager
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

