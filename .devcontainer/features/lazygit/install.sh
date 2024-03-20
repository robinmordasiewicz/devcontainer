#!/bin/bash
set -e

echo "Activating feature 'lazygit'"

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
ARCHTYPE=$(dpkg-architecture -q DEB_BUILD_ARCH)
echo "Architecture is ${ARCHTYPE}"

if [[ "${ARCHTYPE}" == "amd64" ]]; then
	ARCHTYPE="x86_64"
fi

echo "Architecture is ${ARCHTYPE}"
wget https://github.com/jesseduffield/lazygit/releases/download/v"${LAZYGIT_VERSION}"/lazygit_"${LAZYGIT_VERSION}"_Linux_${ARCHTYPE}.tar.gz -O lazygit.tar.gz
tar xf lazygit.tar.gz lazygit
rm lazygit.tar.gz
install lazygit /usr/local/bin
rm lazygit

