#!/bin/sh
chmod a+x ./posture
chmod a+x ./uninstall.sh
currentDir=$(pwd)
echo "# Here is the configurations of posture"
echo "export POSTUREPATH=${currentDir}" >> ~/.bash_profile
echo "export PATH=\$PATH:${POSTUREPATH}" >> ~/.bash_profile
source ~/.bash_profile
echo "install successfully"
