#!/usr/bin/env bash
# <help>Install gparted</help>

setup

is_gparted_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which gparted)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_gparted() {
    echo "Installing gparted now"
    # INSTALL CODE HERE
    sudo apt install gparted
}

ask_install_gparted() {
    is_gparted_installed && return
    if ask "Install gparted?"; then 
        type install_gparted | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_gparted

[ "$ALL" == "" ] && run_todo
