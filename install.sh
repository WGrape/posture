#!/bin/sh
chmod a+x ./posture
chmod a+x ./uninstall.sh
currentDir=$(pwd)

if grep -qF 'export POSTUREPATH=' ~/.bash_profile; then
    echo "please clear installed data of posture in your ~/.bash_profile"
    exit 1
fi

echo "# Here is the configurations of posture" >> ~/.bash_profile
echo "export POSTUREPATH=${currentDir}" >> ~/.bash_profile
echo "export PATH=\$PATH:\$POSTUREPATH" >> ~/.bash_profile
source ~/.bash_profile &> /dev/null
echo "install successfully"
