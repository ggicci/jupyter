#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# jupyter lab --generate-config

mkdir -p /root/.jupyter

echo "
c.NotebookApp.ip = '0.0.0.0'
c.LabApp.port = 80
c.LabApp.password_required = True

# Change your password here, and generate hashed password with command:
# python -c \"from notebook.auth import passwd; print(passwd('123456'));\"
c.LabApp.password = 'argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$z28Rr1kaf8MNxr/4PRTl4w\$ESST3oUlItkJAWCiY0cycg'

c.LabApp.allow_root = True
c.LabApp.open_browser = False
c.LabApp.allow_password_change = True
" > /root/.jupyter/jupyter_notebook_config.py

# Start jupyter lab server
jupyter lab

