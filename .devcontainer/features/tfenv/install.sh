#!/bin/bash
set -e

#su -l vscode -c "git clone --depth=1 https://github.com/tfutils/tfenv.git /home/vscode/.tfenv"
su -l vscode -c "/home/vscode/.tfenv/bin/tfenv install"
su -l vscode -c "/home/vscode/.tfenv/bin/tfenv use"
