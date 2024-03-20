#!/bin/bash
#

echo "vscode ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/vscode

wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd_1.0.0_"$(dpkg-architecture -q DEB_BUILD_ARCH)".deb -O /tmp/lsd.deb
apt-get install /tmp/lsd.deb
rm -rf /tmp/lsd.deb

if ! [ -d /home/vscode/.local/bin ]; then
	mkdir -p /home/vscode/.local/bin
fi
if ! [ -d /home/vscode/.oh-my-posh/themes/ ]; then
	mkdir -p /home/vscode/.oh-my-posh/themes
fi
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /home/vscode/.local/bin -t /home/vscode/.oh-my-posh/themes
/home/vscode/.local/bin/oh-my-posh font install Meslo
wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/powerlevel10k.omp.json -O /home/vscode/.oh-my-posh/themes/powerlevel10k.omp.json
# shellcheck disable=SC2016
echo 'eval "$(oh-my-posh init zsh --config /home/vscode/.oh-my-posh/themes/powerlevel10k.omp.json)"' >>/home/vscode/.zshrc
# shellcheck disable=SC2016
echo 'eval "$(oh-my-posh init bash --config /home/vscode/.oh-my-posh/themes/powerlevel10k.omp.json)"' >>/home/vscode/.bashrc
if ! [ -f /home/vscode/.z ]; then
	wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O /home/vscode/.z
fi

conda init --all
conda config --set changeps1 False

wget https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion -O /home/vscode/.oh-my-zsh/custom/az.zsh

wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/.tmux.conf -O /home/vscode/.tmux.conf
if ! [ -d /home/vscode/.tmux/plugins ]; then
  mkdir -p /home/vscode/.tmux/plugins
fi
if ! [ -d /home/vscode/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm /home/vscode/.tmux/plugins/tpm
else
  cd /home/vscode/.tmux/plugins/tpm && git pull
fi

#tfenv install
#tfenv use

if ! [ -d /home/vscode/.vim/pack/plugin/start ]; then
	mkdir -p /home/vscode/.vim/pack/plugin/start
fi

if ! [ -d /home/vscode/.vim/pack/plugin/start/vim-airline ]; then
	git clone https://github.com/vim-airline/vim-airline /home/vscode/.vim/pack/plugin/start/vim-airline
else
	cd /home/vscode/.vim/pack/plugin/start/vim-airline || return
	git pull
fi

if ! [ -d /home/vscode/.vim/pack/plugin/start/vim-terraform ]; then
	git clone https://github.com/hashivim/vim-terraform.git /home/vscode/.vim/pack/plugin/start/vim-terraform
else
	cd /home/vscode/.vim/pack/plugin/start/vim-terraform || return
	git pull
fi

if ! [ -d /home/vscode/.vim/pack/themes/start ]; then
	mkdir -p /home/vscode/.vim/pack/themes/start
fi

if ! [ -d /home/vscode/.vim/pack/themes/start/vim-code-dark ]; then
	git clone https://github.com/tomasiser/vim-code-dark /home/vscode/.vim/pack/themes/start/vim-code-dark
else
	cd /home/vscode/.vim/pack/themes/start/vim-code-dark || return
	git pull
fi

wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/.vimrc -O /home/vscode/.vimrc

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
ARCH=$(dpkg-architecture -q DEB_BUILD_ARCH)
if [ "${ARCH}" == "amd64" ]; then
	ARCH="32-bit"
fi
wget https://github.com/jesseduffield/lazygit/releases/download/v"${LAZYGIT_VERSION}"/lazygit_"${LAZYGIT_VERSION}"_Linux_"${ARCH}".tar.gz -O lazygit.tar.gz
tar xf lazygit.tar.gz lazygit
rm lazygit.tar.gz
install lazygit /usr/local/bin
rm lazygit

npm install -g npm@latest
npm install -g opencommit
echo "OCO_AI_PROVIDER=ollama" >/home/vscode/.opencommit

yes y | conda update -n base -c conda-forge conda
yes y | conda update --all
yes y | conda update -n base -c conda-forge conda --repodata-fn=repodata.json

# shellcheck disable=SC1091
source /opt/conda/etc/profile.d/conda.sh

wget https://raw.githubusercontent.com/robinmordasiewicz/devcontainer/main/.devcontainer/mkdocs-environment.yml /tmp/mkdocs-environment.yml
conda env create -f /tmp/mkdocs-environment.yml


