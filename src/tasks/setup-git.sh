#!/usr/bin/env bash
# <help>Install setup-git</help>

setup

is_setup-git_installed() {
    # If you return true/1 here then it is already installed
    [ "$(which setup)" == "" ]
    # [ -d /some/diraectory ]
    false
}

install_setup-git() {
    echo "Installing setup-git now"
    # INSTALL CODE HERE
    echo "Type in your first and last name (no accent or special characters - e.g. 'ç'): "
    read full_name
    echo "Type in your email address: "
    read email
    echo "Type in cache timeout (in seconde)(3600 is good idea): "
    read timeout
    git config --global user.email $email
    git config --global user.name "$full_name"
    git config --global credential.helper 'cache --timeout=$timeout'
    fi
}

ask_install_setup-git() {
    is_setup-git_installed && return
    if ask "Install setup-git?"; then 
        type install_setup-git | sed '1,3d;$d' | sed 's/^\s*//g' >> $RUNFILE
        echo " " >> $RUNFILE
    fi
}

ask_install_setup-git

[ "$ALL" == "" ] && run_todo
