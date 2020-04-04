#!/usr/bin/env bash
# <help>Install picard</help>

setup

is_picard_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which picard)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_picard() {
    echo "Installing picard now"
    # INSTALL CODE HERE
    sudo apt insall picard
}

ask_install_picard() {
    is_picard_installed && return
    if ask "Install picard?"; then 
        type install_picard | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_picard

[ "$ALL" == "" ] && run_todo
