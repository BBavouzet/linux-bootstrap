#!/usr/bin/env bash
# <help>Install filezilla</help>

setup

is_filezilla_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which filezilla)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_filezilla() {
    echo "Installing filezilla now"
    # INSTALL CODE HERE
    sudo apt install filezilla
}

ask_install_filezilla() {
    is_filezilla_installed && return
    if ask "Install filezilla?"; then 
        type install_filezilla | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_filezilla

[ "$ALL" == "" ] && run_todo
