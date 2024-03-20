#!/bin/bash
set -e

echo "Activating feature 'vimrc'"

su -l vscode -c "mkdir -p /home/vscode/.vim/pack/plugin/start"
su -l vscode -c "git clone https://github.com/vim-airline/vim-airline /home/vscode/.vim/pack/plugin/start/vim-airline"
su -l vscode -c "git clone https://github.com/hashivim/vim-terraform.git /home/vscode/.vim/pack/plugin/start/vim-terraform"
su -l vscode -c "mkdir -p /home/vscode/.vim/pack/themes/start"
su -l vscode -c "git clone https://github.com/tomasiser/vim-code-dark /home/vscode/.vim/pack/themes/start/vim-code-dark"
su -l vscode -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/.vimrc -O /home/vscode/.vimrc"

