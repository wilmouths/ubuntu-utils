#!/bin/bash

onoff=on

cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose the plugin to install:' 0 0 0)

loadDialog () {
  options=(
    1 'Ghostery' $onoff
    2 'AdBlockPlus' $onoff
    3 'KeePassXC-Browser' $onoff
    4 'GNOME Shell' $onoff
  )
  choices=$("${cmd[@]}" "${options[@]}")
}

loadDialog

exitCode="$?"

while [[ $exitCode -ne 0 ]]; do
  case $exitCode in
    1) clear; onoff=off; loadDialog;;
    3) clear; onoff=on; loadDialog;;
  esac
  exitCode="$?"
done

clear

ghostery () {
  printf "\n[FireFox: install Ghostery plugin]\n"
  firefox -slient https://addons.mozilla.org/firefox/downloads/file/3803046/ &
  kill -9 $!
}

abp () {
  printf "\n[FireFox: install AdBlockPlus plugin]\n"
  firefox -slient https://addons.mozilla.org/firefox/downloads/file/3816113/ &
  kill -9 $!
}

keePassXCBrowser () {
  printf "\n[FireFox: install KeePassXC-Browser plugin]\n"
  firefox -slient https://addons.mozilla.org/firefox/downloads/file/3813940/ &
  kill -9 $!
}

GNOMEShell () {
  printf "\n[FireFox: install GNOME Shell plugin]\n"
  firefox -slient https://addons.mozilla.org/firefox/downloads/file/898030/ &
  kill -9 $!
}

for choice in $choices
do
  case $choice in
    1) ghostery;;
    2) abp;;
    3) keePassXCBrowser;;
    4) GNOMEShell;;
  esac
done