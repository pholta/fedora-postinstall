#!/bin/bash

# Post-install script - Fedora 19

# RPM Fusion repository
yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y;

# Audio Video codecs + VLC
yum install gstreamer-plugins-{good,bad,ugly} gstreamer-ffmpeg ffmpeg vlc gstreamer1-plugins-ugly gstreamer1-libav -y ;

# Libre Office
yum install libreoffice-{writer,calc,impress} -y;

# Google Chrome stable
# Enable Google YUM repository
touch /etc/yum.repos.d/google-chrome.repo
echo "
[google-chrome]
name=google-chrome - 32-bit
baseurl=http://dl.google.com/linux/chrome/rpm/stable/i386
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub

name=google-chrome - 64-bit
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" >> /etc/yum.repos.d/google-chrome.repo
yum install google-chrome-stable -y

# Graphical stuff - Gimp (photo editor), Hugin (panoramic tool)
yum install gimp hugin -y

# Gnome Tweak tool to customize advanced GNOME 3 options
yum gnome-tweak-tool -y

