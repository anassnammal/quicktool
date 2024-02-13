#!/bin/sh

# This script is used to setup openbox for the first time on debian 12

# Install xorg
sudo apt -y install xorg

# Install openbox
sudo apt -y install openbox

# Install obconf
sudo apt -y install obconf

# Install obmenu
sudo apt -y install obmenu

# Install obmenu-generator
sudo apt -y install obmenu-generator

# Install obkey
sudo apt -y install obkey

# Install tint2
sudo apt -y install tint2

# Install lxappearance
sudo apt -y install lxappearance

# Install nitrogen
sudo apt -y install nitrogen

# Install compton
sudo apt -y install compton

# Install lxpolkit
sudo apt -y install lxpolkit

# Install lxsession
sudo apt -y install lxsession

# Install lxsession-edit
sudo apt -y install lxsession-edit

# Install lxinput
sudo apt -y install lxinput

# Install lxrandr
sudo apt -y install lxrandr

# Install lxhotkey
sudo apt -y install xbindkeys
xbindkeys --defaults > $HOME/.xbindkeysrc

# Install lxshortcut
sudo apt -y install lxshortcut

# Install lxsession-logout
sudo apt -y install lxsession-logout
