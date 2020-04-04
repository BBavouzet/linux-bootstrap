#!/usr/bin/env bash
# <help>Install lm-sensors</help>

setup

is_lm-sensors_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which lm-sensors)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_lm-sensors() {
    echo "Installing lm-sensors now"
    # INSTALL CODE HERE
    sudo apt install lm-sensors
}

ask_install_lm-sensors() {
    is_lm-sensors_installed && return
    if ask "Install lm-sensors?"; then 
        type install_lm-sensors | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_lm-sensors

[ "$ALL" == "" ] && run_todo
