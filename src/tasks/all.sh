#!/usr/bin/env bash
# <help>Install everything (after asking if you want to)</help>

export ALL=1

install_base_packages

setup

echo " "
echo " "

# Start Commands
if [ -n "$DISPLAY" ]; then
  $0 default_gui_packages
  $0 vscode
  $0 opera
  $0 spotify
  $0 terraform
  $0 peek
  $0 google-chrome
  $0 touchpad_indicator
  $0 copyq
  $0 wavebox
  $0 y_ppa_manager
fi

$0 dotfiles
$0 bash_it
$0 nodenv
$0 goenv
$0 pyenv
$0 xonsh
$0 docker
$0 awscli
$0 etckeeper
$0 fix_max_user_watches
$0 fix_sudo
$0 clementine
$0 Ao
$0 composer
$0 chromium-browser
$0 flatpak
$0 gparted
$0 gpodder
$0 htop
$0 inkscape
$0 gimp
$0 lm-sensors
$0 lame
$0 filezilla
$0 handbrake
$0 molotov
$0 picard
$0 libdvd-pkg
$0 setup-git
$0 setup-docker
$0 firefox-dev
# End Commands

run_todo
