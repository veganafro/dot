export EDITOR='emacs -nw'

alias adb='~/Library/Android/sdk/platform-tools/adb'

export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="/usr/local/sbin:$PATH"
