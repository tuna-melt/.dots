#!/bin/bash
PATH="$PATH:~/bin"

# Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# PSQL cli
export PATH="$PATH:/usr/local/opt/postgresql@14/bin"

# Python Setup
export PYENV_ROOT="/usr/local/var/pyenv"
export PATH="$PATH:$PYENV_ROOT/shim"

export PATH="$HOME/.poetry/bin:$PATH"

# Lazy load pyenv
function pyenv() {
    unset -f pyenv
    eval "$(pyenv init - 2> /dev/null)"
    eval "$(pyenv virtualenv-init - 2> /dev/null)"
    [ ! -z $@  ] && pyenv $@
}

function pyclean() {
    find . -regex "\(.*__pycache__.*\|*.py[co]\)" -delete
}

# Go Setup
export GOPATH=$HOME/go-workspace # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Rust Setup
export PATH="$PATH:$HOME/.cargo/bin"

# scripts
export PATH="$PATH:$HOME/.dots/scripts/exe"
