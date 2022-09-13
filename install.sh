#!/bin/sh
chmod a+x ./posture
currentDir=$(pwd)
echo "export POSTUREPATH=${currentDir}" >> ~/.bash_profile
echo "export PATH=\$PATH:${currentDir}" >> ~/.bash_profile
echo "install successfully"
