#!/usr/bin/env bash
# <help>Install Ao</help>

setup

is_Ao_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which Ao)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_Ao() {
    echo "Installing Ao now"
    # INSTALL CODE HERE
    mkdir $HOME/aeffacer
    wget -P $HOME/aeffacer/ https://github.com/klaussinani/ao/releases/download/v6.9.0/ao_6.9.0_amd64.deb
    dpkg -i $HOME/aeffacer/ao_6.9.0_amd64.deb
}

ask_install_Ao() {
    is_Ao_installed && return
    if ask "Install Ao?"; then 
        type install_Ao | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_Ao

[ "$ALL" == "" ] && run_todo
