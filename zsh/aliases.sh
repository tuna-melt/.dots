#!/bin/bash

# ALIASES
alias k=kubectl
alias ol='cd ~/onelogin; onelogin-aws-assume-role --onelogin-password $(security find-generic-password -s onelogin -w) --profile default; cd $OLDPWD'
alias gr='grep --exclude-dir=node_modules --exclude-dir=__pycache__ --exclude-dir=modules'
alias v=nvim
alias tclear='tmux kill-session -a'
alias pe='poetry run python'
alias theme="bash ~/.dots/scripts/theme.sh"

alias ls="bash ~/.dots/scripts/fancy_ls.sh"
alias g="~/.dots/scripts/fancy_git"

# key binding for kitty
bindkey '\e[1;3D' backward-word # ⌥←
bindkey '\e[1;3C' forward-word # ⌥→
