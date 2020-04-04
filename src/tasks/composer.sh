#!/usr/bin/env bash
# <help>Install composer</help>

setup

is_composer_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which composer)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_composer() {
    echo "Installing composer now"
    # INSTALL CODE HERE
    sudo apt install composer
}

ask_install_composer() {
    is_composer_installed && return
    if ask "Install composer?"; then 
        type install_composer | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_composer

[ "$ALL" == "" ] && run_todo
