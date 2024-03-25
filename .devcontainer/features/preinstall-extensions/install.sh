#!/bin/env bash
set -e

# USAGE:
# COPY .devcontainer/ /app/.devcontainer/
# ARG VSCODE_VERSION=2ccd690cbff1569e4a83d7c43d45101f817401dc
# RUN bash .devcontainer/preinstall-vscode-extensions.sh $VSCODE_VERSION /app/.devcontainer/devcontainer.json
# 
#Version: 1.87.2
#Commit: 863d2581ecda6849923a2118d93a088b0745d9d6
#Date: 2024-03-08T15:14:59.643Z
#Electron: 27.3.2
#ElectronBuildId: 26836302
#Chromium: 118.0.5993.159
#Node.js: 18.17.1
#V8: 11.8.172.18-electron.0
#OS: Linux x64 6.5.0-25-generic


vscode_commit_sha="863d2581ecda6849923a2118d93a088b0745d9d6"
devcontainer_path="https://raw.githubusercontent.com/robinmordasiewicz/devcontainer/main/.devcontainer/devcontainer.json"
curl -s -L "${devcontainer_path}" -o "/tmp/devcontainer.json"

ARCH="x64"
U_NAME=$(uname -m)
if [ "${U_NAME}" = "aarch64" ]; then
    ARCH="arm64"
fi

archive="vscode-server-linux-${ARCH}.tar.gz"
vscode_dir="~/.vscode-server/bin/${vscode_commit_sha}"

echo "will attempt to download VS Code Server version = '${vscode_commit_sha}'"
curl -s -L "https://update.code.visualstudio.com/commit:${vscode_commit_sha}/server-linux-${ARCH}/stable" -o "/tmp/${archive}"

mkdir -vp "$vscode_dir"
tar --no-same-owner -xz --strip-components=1 -C "$vscode_dir" -f "/tmp/${archive}"

extensions=$(jq -r '.customizations.vscode.extensions | .[]' /tmp/devcontainer.json)

for ext in $extensions; do
    "$vscode_dir/bin/code-server" --install-extension $ext;
done

rm -rd "$vscode_dir"
rm "/tmp/${archive}"
rm /tmp/devcontainer.json

