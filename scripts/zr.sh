WINDOW_POSITION="top"

[  $(tput cols) -gt 150  ] && WINDOW_POSITION="right"


LS -p | grep -v / | fzf --ansi -m --preview='cat {}' --preview-window="$WINDOW_POSITION"

