#!/bin/bash

# Post-install script - Fedora 29
# I run this script just after a fresh install of Fedora

# first, updating the system
sudo dnf update -y

# RPM Fusion repository - universal based on the distro version.. 
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;

# Audio Video codecs + VLC
sudo dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1 vlc -y

# Libre office + Czech
sudo dnf install libreoffice libreoffice-langpack-cs -y

# Third-party repositories 
# Google Chrome, PyCharm, Steam
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled  google-chrome  
sudo dnf config-manager --set-enabled  rpmfusion-nonfree-steam 
sudo dnf install google-chrome -y
sudo dnf install steam -y

# Graphical stuff - Gimp (photo editor), Hugin (panoramic tool), Darktable (raw files processor)
sudo dnf install gimp hugin darktable -y

#dropbox integration
sudo dnf install dropbox -y

# Xchat - IRC client
sudo dnf install xchat -y

# Gnome Tweak tool to customize advanced GNOME 3 options
sudo dnf install gnome-tweak-tool -y

#Gnome Shell Tweaks
#adding all buttons - minimize,maximize,close
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
#show seconds
gsettings set org.gnome.desktop.interface clock-show-seconds true
#show date
gsettings set org.gnome.desktop.interface clock-show-date true
#show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true
#show week number
gsettings set org.gnome.desktop.calendar show-weekdate true
