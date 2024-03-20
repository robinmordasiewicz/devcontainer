#!/bin/bash
set -e

echo "Activating feature 'Shell Environments'"

su -l vscode -c "mkdir -p /home/vscode/.local/bin"
su -l vscode -c "mkdir -p /home/vscode/.oh-my-posh/themes"

su -l vscode -c "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /home/vscode/.local/bin -t /home/vscode/.oh-my-posh/themes"
#su -l vscode -c "/home/vscode/.local/bin/oh-my-posh font install Meslo"
su -l vscode -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/powerlevel10k.omp.json -O /home/vscode/.oh-my-posh/themes/powerlevel10k.omp.json"
# shellcheck disable=SC2016
su -l vscode -c "echo 'eval \"\$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/powerlevel10k.omp.json)\"' >> /home/vscode/.zshrc"
# shellcheck disable=SC2016
su -l vscode -c "echo 'eval \"\$(oh-my-posh init bash --config ~/.oh-my-posh/themes/powerlevel10k.omp.json)\"' >> /home/vscode/.bashrc"

su -l vscode -c "wget https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion -O /home/vscode/.oh-my-zsh/custom/az.zsh"

su -l vscode -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/.tmux.conf -O /home/vscode/.tmux.conf"
su -l vscode -c "mkdir -p /home/vscode/.tmux/plugins"
su -l vscode -c "git clone https://github.com/tmux-plugins/tpm /home/vscode/.tmux/plugins/tpm"

su -l vscode -c "mkdir -p /home/vscode/.config/powershell"
su -l vscode -c "wget https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/powerlevel10k.omp.json -O /home/vscode/.config/powershell/Microsoft.PowerShell_profile.ps1"

su -l vscode -c "echo 'OCO_AI_PROVIDER=ollama' >/home/vscode/.opencommit"
