#!/bin/bash
set -e

echo "Activating feature 'update conda'"

su -l vscode -c "source /opt/conda/etc/profile.d/conda.sh && yes y | /opt/conda/bin/conda update -n base -c conda-forge conda"
su -l vscode -c "source /opt/conda/etc/profile.d/conda.sh && yes y | /opt/conda/bin/conda update --all"
su -l vscode -c "source /opt/conda/etc/profile.d/conda.sh && yes y | /opt/conda/bin/conda update -n base -c conda-forge conda --repodata-fn=repodata.json"

su -l vscode -c "/opt/conda/bin/conda init --all"
su -l vscode -c "/opt/conda/bin/conda config --set changeps1 False"
