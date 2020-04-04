#!/usr/bin/env bash
# <help>Install lame</help>

setup

is_lame_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which lame)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_lame() {
    echo "Installing lame now"
    # INSTALL CODE HERE
    sudo apt install lame
}

ask_install_lame() {
    is_lame_installed && return
    if ask "Install lame?"; then 
        type install_lame | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_lame

[ "$ALL" == "" ] && run_todo
