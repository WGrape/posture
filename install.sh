#!/bin/sh
chmod a+x ./posture
currentDir=$(pwd)
sed -a "POSTUREPATH="$currentDir
sed -a "export PATH=\$PATH:$currentDir"
echo "install successfully"
