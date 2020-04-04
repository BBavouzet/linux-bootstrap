#!/usr/bin/env bash
# <help>Install setup-docker</help>

setup

is_setup-docker_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which docker.io)" == "" ]
    # [ -d /some/diraectory ]
    false
}

install_setup-docker() {
    echo "Installing setup-docker now"
    # INSTALL CODE HERE
    # Add $USER to docker group
    echo "Adding current USER to docker group"
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

ask_install_setup-docker() {
    is_setup-docker_installed && return
    if ask "Install setup-docker?"; then 
        type install_setup-docker | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_setup-docker

[ "$ALL" == "" ] && run_todo
