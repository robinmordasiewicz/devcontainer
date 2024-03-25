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

EXTENSIONS=${EXTENSIONS:-undefined}

vscode_commit_sha="863d2581ecda6849923a2118d93a088b0745d9d6"

ARCH="x64"
U_NAME=$(uname -m)
if [ "${U_NAME}" = "aarch64" ]; then
    ARCH="arm64"
fi

archive="vscode-server-linux-${ARCH}.tar.gz"
vscode_dir="/tmp/.vscode/"
if [ ! -d  ${vscode_dir} ]; then
    su -l $_REMOTE_USER -c "mkdir -p ${vscode_dir}"
fi

curl -s -L "https://update.code.visualstudio.com/commit:${vscode_commit_sha}/server-linux-${ARCH}/stable" -o "/tmp/${archive}"

tar --no-same-owner -xz --strip-components=1 -C "$vscode_dir" -f "/tmp/${archive}"

if [ ! -d  $_REMOTE_USER_HOME/.vscode-server/extensions ]; then
    su -l $_REMOTE_USER -c "mkdir -p $_REMOTE_USER_HOME/.vscode-server/extensions"
fi

IFS=',' read -ra EXTENSIONS_ARRAY <<< "$EXTENSIONS"

for ext in "${EXTENSIONS_ARRAY[@]}"; do
    su -l $_REMOTE_USER -c "$vscode_dir/bin/code-server --install-extension $ext --extensions-dir $_REMOTE_USER_HOME/.vscode-server/extensions"
done

rm -rd "$vscode_dir"
rm "/tmp/${archive}"
