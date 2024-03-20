#!/bin/bash
set -e

echo "Activating feature 'setup'"

echo "vscode ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode

npm install -g npm@latest
npm install -g opencommit

apt update
apt-get -y upgrade
apt -y autoremove
