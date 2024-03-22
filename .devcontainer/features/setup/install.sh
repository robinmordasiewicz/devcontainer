#!/bin/bash
set -e

echo "Activating feature 'setup'"

echo "$_REMOTE_USER ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$_REMOTE_USER

npm install -g npm@latest
npm install -g opencommit

apt update
apt-get -y upgrade
apt -y autoremove
