#!/usr/bin/env bash
# <help>Install chromium-browser</help>

setup

is_chromium-browser_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which chromium-browser)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_chromium-browser() {
    echo "Installing chromium-browser now"
    # INSTALL CODE HERE
    sudo apt install chromium-browser
}

ask_install_chromium-browser() {
    is_chromium-browser_installed && return
    if ask "Install chromium-browser?"; then 
        type install_chromium-browser | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_chromium-browser

[ "$ALL" == "" ] && run_todo
