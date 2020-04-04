#!/usr/bin/env bash
# <help>Install flatpak</help>

setup

is_flatpak_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which flatpak)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_flatpak() {
    echo "Installing flatpak now"
    # INSTALL CODE HERE
    sudo apt install flatpak
}

ask_install_flatpak() {
    is_flatpak_installed && return
    if ask "Install flatpak?"; then 
        type install_flatpak | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_flatpak

[ "$ALL" == "" ] && run_todo
