#!/usr/bin/env bash
# <help>Install firefox-dev</help>

setup

is_firefox-dev_installed() {
    # If you return true/1 here then it is already installed
    # [ "$(which firefox-dev)" != "" ]
    [ -d /opt/firefox ]
    false
}

install_firefox-dev() {
    echo "Installing firefox-dev now"
    # INSTALL CODE HERE
    sudo mkdir /opt/firefox
    wget -O /opt/firefox/installfirefox.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=fr"
    sudo tar xjf /opt/firefox/installfirefox.tar.bz2 -C /opt/firefox/
    sudo cp ./assets/firefox-devedition.desktop /usr/share/applications/firefox-devedition.desktop
    sudo chown -R $USER:$USER /opt/firefox && sudo chown root:root /usr/share/applications/firefox-devedition.desktop
}

ask_install_firefox-dev() {
    is_firefox-dev_installed && return
    if ask "Install firefox-dev?"; then 
        type install_firefox-dev | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_firefox-dev

[ "$ALL" == "" ] && run_todo
