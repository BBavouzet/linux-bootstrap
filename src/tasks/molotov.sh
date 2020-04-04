#!/usr/bin/env bash
# <help>Install molotov</help>

setup

is_molotov_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which molotov)" != "" ]
    # [ -d /some/diraectory ]
    false
}

install_molotov() {
    echo "Installing molotov now"
    # INSTALL CODE HERE
    sudo mkdir /opt/molotov
    sudo chmod 755 /opt/molotov
    sudo wget http://desktop-auto-upgrade.molotov.tv/linux/4.2.2/molotov.AppImage -O /opt/molotov/molotov.AppImage
    sudo chmod +x /opt/molotov/molotov.AppImage
    cd /opt/molotov && ./molotov.AppImage
    echo "Hit enter to continue" && read
}

ask_install_molotov() {
    is_molotov_installed && return
    if ask "Install molotov?"; then 
        type install_molotov | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_molotov

[ "$ALL" == "" ] && run_todo
