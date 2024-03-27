#!/bin/bash
set -e

su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.local/bin"
su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.oh-my-posh/themes"

su -l $_REMOTE_USER -c "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $_REMOTE_USER_HOME/.local/bin -t $_REMOTE_USER_HOME/.oh-my-posh/themes"
su -l $_REMOTE_USER -c "curl -o $_REMOTE_USER_HOME/.oh-my-posh/themes/powerlevel10k.omp.json https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/powerlevel10k.omp.json"

# shellcheck disable=SC2016
su -l $_REMOTE_USER -c "echo 'eval \"\$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/powerlevel10k.omp.json)\"' >> $_REMOTE_USER_HOME/.zshrc"
# shellcheck disable=SC2016
su -l $_REMOTE_USER -c "echo 'eval \"\$(oh-my-posh init bash --config ~/.oh-my-posh/themes/powerlevel10k.omp.json)\"' >> $_REMOTE_USER_HOME/.bashrc"

su -l $_REMOTE_USER -c "curl -o $_REMOTE_USER_HOME/.oh-my-zsh/custom/az.zsh https://raw.githubusercontent.com/Azure/azure-cli/dev/az.completion"

su -l $_REMOTE_USER -c "curl -o $_REMOTE_USER_HOME/.tmux.conf https://raw.githubusercontent.com/robinmordasiewicz/dotfiles/main/.tmux.conf"
su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.tmux/plugins"
su -l $_REMOTE_USER -c "git clone https://github.com/tmux-plugins/tpm $_REMOTE_USER_HOME/.tmux/plugins/tpm"


if command -v /opt/conda/bin/conda &> /dev/null; then
  su -l $_REMOTE_USER -c "/opt/conda/bin/conda init --all"
  su -l $_REMOTE_USER -c "/opt/conda/bin/conda config --set changeps1 False"
fi
