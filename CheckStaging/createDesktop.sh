#!/bin/bash

echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=true
Exec=$PWD/checkRunning.sh
Name=Check Staging Env
Icon=$PWD/sample.png
" > desktop.txt

sudo cp desktop.txt /usr/share/applications/CheckStagingEnv.desktop