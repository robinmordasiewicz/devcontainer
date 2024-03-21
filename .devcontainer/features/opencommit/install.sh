#!/bin/bash
set -e

WORKINGDIR=$(pwd)

echo "OCO_AI_PROVIDER=ollama" > ~/.opencommit
oco hook set


#REPODIR="$(pwd)"
#if ! [ -d /tmp/opencommit ]; then
#  git clone https://github.com/di-sukharev/opencommit.git /tmp/opencommit
#else
#  cd /tmp/opencommit || return
#  git pull
#fi
#cd /tmp/opencommit &&  git apply ${REPODIR}/.devcontainer/opencommit-ollama.patch
#sudo -H env PATH=$PATH npm install -g
#cd ${REPODIR}
