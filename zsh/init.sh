# Open tmux automatically
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~  tmux ]] && [ -z "$TMUX" ]; then
    exec tmux -f ~/.dots/tmux.conf
else
    DOTZSH="$HOME/.dots/zsh"
    source "$DOTZSH/environment.sh"
    source "$DOTZSH/aesthetic.sh"
    source "$DOTZSH/utils.sh"
    source "$DOTZSH/aliases.sh"
    source "$DOTZSH/completion.sh"

    # Pluggins
    zsh_add_plugin "lukechilds/zsh-nvm"
fi
