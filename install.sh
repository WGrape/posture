#!/bin/sh
chmod a+x ./posture
currentDir=$(pwd)
echo "# Here is the configurations of posture"
echo "export POSTUREPATH=${currentDir}" >> ~/.bash_profile
echo "export PATH=\$PATH:${currentDir}" >> ~/.bash_profile
source ~/.bash_profile
echo "install successfully"
