#!/usr/bin/env bash
# <help>Install gpodder</help>

setup

is_gpodder_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which gpodder)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_gpodder() {
    echo "Installing gpodder now"
    # INSTALL CODE HERE
    sudo apt install gpodder
}

ask_install_gpodder() {
    is_gpodder_installed && return
    if ask "Install gpodder?"; then 
        type install_gpodder | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_gpodder

[ "$ALL" == "" ] && run_todo
