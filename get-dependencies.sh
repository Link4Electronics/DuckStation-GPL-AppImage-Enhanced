#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    kvantum       \
    lxqt-qtplugin \
    qt6ct

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package llvm19
make-aur-package lld19
make-aur-package clang19
make-aur-package duckstation

# If the application needs to be manually built that has to be done down here
mkdir -p ./AppDir/bin
mv -v /opt/duckstation/* ./AppDir/bin
