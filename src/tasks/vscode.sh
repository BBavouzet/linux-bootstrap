#!/usr/bin/env bash
# <help>Install vscode</help>

setup
    
is_vscode_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which code)" != "" ]
}

install_vscode() {
    echo "Installing vscode now"
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
    echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
    sudo apt install codium
}

ask_install_vscode() {
    is_vscode_installed && return
    if ask "Install vscode?"; then 
        type install_vscode | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_vscode

[ "$ALL" == "" ] && run_todo
