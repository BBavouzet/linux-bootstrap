#!/usr/bin/env bash
# <help>Install inkscape</help>

setup

is_inkscape_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which inkscape)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_inkscape() {
    echo "Installing inkscape now"
    # INSTALL CODE HERE
    sudo apt install inkscape
}

ask_install_inkscape() {
    is_inkscape_installed && return
    if ask "Install inkscape?"; then 
        type install_inkscape | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_inkscape

[ "$ALL" == "" ] && run_todo
