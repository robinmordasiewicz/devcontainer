#!/bin/bash
set -e

echo "Activating feature 'Shell Environments'"

su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.local/bin"
su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.oh-my-posh/themes"

su -l $_REMOTE_USER -c "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $_REMOTE_USER_HOME/.local/bin -t $_REMOTE_USER_HOME/.oh-my-posh/themes"
#su -l $_REMOTE_USER -c "$_REMOTE_USER_HOME/.local/bin/oh-my-posh font install Meslo"
su -l $_REMOTE_USER -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/powerlevel10k.omp.json -O $_REMOTE_USER_HOME/.oh-my-posh/themes/powerlevel10k.omp.json"
# shellcheck disable=SC2016
su -l $_REMOTE_USER -c "echo 'eval \"\$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/powerlevel10k.omp.json)\"' >> $_REMOTE_USER_HOME/.zshrc"
# shellcheck disable=SC2016
su -l $_REMOTE_USER -c "echo 'eval \"\$(oh-my-posh init bash --config ~/.oh-my-posh/themes/powerlevel10k.omp.json)\"' >> $_REMOTE_USER_HOME/.bashrc"

su -l $_REMOTE_USER -c "wget https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion -O $_REMOTE_USER_HOME/.oh-my-zsh/custom/az.zsh"

su -l $_REMOTE_USER -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/.tmux.conf -O $_REMOTE_USER_HOME/.tmux.conf"
su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.tmux/plugins"
su -l $_REMOTE_USER -c "git clone https://github.com/tmux-plugins/tpm $_REMOTE_USER_HOME/.tmux/plugins/tpm"

su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.config/powershell"
su -l $_REMOTE_USER -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/Microsoft.PowerShell_profile.ps1 -O $_REMOTE_USER_HOME/.config/powershell/Microsoft.PowerShell_profile.ps1"

su -l $_REMOTE_USER -c "echo 'OCO_AI_PROVIDER=ollama' >$_REMOTE_USER_HOME/.opencommit"

WORKINGDIR=$(pwd)

DOWNLOADLOCATION=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r '.assets[] | select(.name=="Meslo.zip").browser_download_url')
wget ${DOWNLOADLOCATION} -O fonts.zip
su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.local/share/fonts"
su -l $_REMOTE_USER -c "unzip ${WORKINGDIR}/fonts.zip -d $_REMOTE_USER_HOME/.local/share/fonts/"
su -l $_REMOTE_USER -c "fc-cache $_REMOTE_USER_HOME/.local/share/fonts"

