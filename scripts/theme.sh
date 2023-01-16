#!/usr/local/bin/bash
source ~/.dots/zsh/utils.sh

DEFAULT_THEME=iceberg
THEMES_DIR="$HOME/.dots/kitty/themes"

function show_all_themes() {
    themes_list=$(ls $THEMES_DIR | cut -d '.' -f 1 | sed s/_light// | uniq)
    echo ""
    printf "  %s\n" $themes_list
    echo ""
}

function set_kitty_theme() {
    file=$THEME
    [ "$THEME_MODE" = "light" ] && file="${THEME}_light"

    # some themes only have light files, they won't have a file without a suffix
    if [ ! -f $THEMES_DIR/$THEME.conf ]; then
        THEME_MODE="light"
        file="${THEME}_light"
    elif [ ! -f $THEMES_DIR/$file.conf ]; then
        THEME_MODE="dark"
        file=$THEME
    fi

    # kitty theme change
    cp $THEMES_DIR/$file.conf ~/.dots/kitty/theme.conf
    kill -SIGUSR1 $(pgrep -a kitty)
}

function change_theme() {
    file="${THEMES_DIR}/${1}.conf"
    light_file="${THEMES_DIR}/${1}_light.conf"

    if [ $1 = "dark" ] || [ $1 = "light" ]; then
        THEME_MODE="$1"
    elif [ -f "$file" ] || [ -f "$light_file" ]; then
        THEME=$1
    else
        echo -e "\n  \e[3mTheme not found\n\e[0m"
        exit 0
    fi

    set_kitty_theme

    # update zsh env
    set_state_value THEME $THEME
    set_state_value THEME_MODE $THEME_MODE
    killall -SIGUSR1 zsh

    # update nvim instances
    # nvr  --serverlist | while read line; do
    #     nvr --servername $line --remote-send "<esc>:let \$THEME = \"$THEME\"<enter>"
    #     nvr --servername $line --remote-send "<esc>:source ~/.dots/nvim/init.lua<enter>"
    # done
}

if [ -z $1 ]; then
    change_theme $DEFAULT_THEME
elif [ "show" = $1 ]; then
    echo -e "\n  $THEME\n"
elif [ "show-all" = $1 ]; then
    show_all_themes
else
    change_theme $1
fi
