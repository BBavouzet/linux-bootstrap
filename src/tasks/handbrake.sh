#!/usr/bin/env bash
# <help>Install handbrake</help>

setup

is_handbrake_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which handbrake)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_handbrake() {
    echo "Installing handbrake now"
    # INSTALL CODE HERE
    sudo apt install handbrake libdvd-pkg
    sudo dpkg-reconfigure libdvd-pkg
}

ask_install_handbrake() {
    is_handbrake_installed && return
    if ask "Install handbrake?"; then 
        type install_handbrake | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_handbrake

[ "$ALL" == "" ] && run_todo
