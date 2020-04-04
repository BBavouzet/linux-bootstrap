#!/usr/bin/env bash
# <help>Install gimp</help>

setup

is_gimp_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which gimp)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_gimp() {
    echo "Installing gimp now"
    # INSTALL CODE HERE
    sudo apt install gimp
}

ask_install_gimp() {
    is_gimp_installed && return
    if ask "Install gimp?"; then 
        type install_gimp | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_gimp

[ "$ALL" == "" ] && run_todo
