#!/bin/bash

# Post-install script - Fedora 22+
# run this script as root just after you freshly installed the system

# first, updating the system
sudo dnf update

# RPM Fusion repository - universal based on the distro version.. 
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;

# Audio Video codecs + VLC
sudo dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1 vlc -y

# Libre office + Czech
sudo dnf install libreoffice libreoffice-langpack-cs -y

# Google Chrome stable
# Enable Google YUM repository
sudo cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

sudo dnf install google-chrome-stable -y

# Graphical stuff - Gimp (photo editor), Hugin (panoramic tool), Darktable (raw files processor)
sudo dnf install gimp hugin darktable -y

#dropbox integration
sudo dnf install dropbox -y

# Xchat - IRC client
sudo dnf install xchat -y

# Gnome Tweak tool to customize advanced GNOME 3 options
sudo dnf install gnome-tweak-tool -y

#Steam for gaming
sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-steam.repo
sudo dnf install steam -y

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
