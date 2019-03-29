#!/bin/bash

echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=true
Exec=$PWD/checkRunning.sh
Name=Check Testing Env
Icon=$PWD/sample.png
" > desktop.txt

sudo cp desktop.txt /usr/share/applications/CheckTestingEnv.desktop