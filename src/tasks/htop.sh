#!/usr/bin/env bash
# <help>Install htop</help>

setup

is_htop_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which htop)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_htop() {
    echo "Installing htop now"
    # INSTALL CODE HERE
    sudo apt install htop
}

ask_install_htop() {
    is_htop_installed && return
    if ask "Install htop?"; then 
        type install_htop | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_htop

[ "$ALL" == "" ] && run_todo
