#!/bin/sh

chmod a+x ./posture
chmod a+x ./uninstall.sh
currentDir=$(pwd)

if grep -qF 'export POSTURE_PATH=' ~/.bash_profile; then
    echo "please clear installed data of posture in your ~/.bash_profile"
    exit 1
fi

echo "# Here is the config of posture" >> ~/.bash_profile
echo "export POSTURE_PATH=${currentDir}" >> ~/.bash_profile
echo "export PATH=\$PATH:\$POSTURE_PATH" >> ~/.bash_profile
source ~/.bash_profile &> /dev/null
echo "install successfully"
