#!/bin/bash
set -e

echo "Activating feature 'lsd'"

wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd_1.0.0_"$(dpkg-architecture -q DEB_BUILD_ARCH)".deb -O /tmp/lsd.deb
apt-get install /tmp/lsd.deb
rm -rf /tmp/lsd.deb

