#!/usr/bin/env bash
# <help>Install clementine</help>

setup

is_clementine_installed() {
    # If you return true/1 here then it is already installed
    # [ "$(which clementine)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_clementine() {
    echo "Installing clementine now"
    # INSTALL CODE HERE
}

ask_install_clementine() {
    is_clementine_installed && return
    if ask "Install clementine?"; then 
        type install_clementine | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_clementine

[ "$ALL" == "" ] && run_todo
