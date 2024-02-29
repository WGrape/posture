#!/bin/sh

sed -i '' '/# Here is the config of posture/,+2d' ~/.bash_profile
source ~/.bash_profile
echo "卸载成功！为确保安全，我们不会执行主动删除操作，您手动删除POSTURE_PATH目录即可 (Uninstall successful! To ensure safety, we will not exec deletion, you should manually delete the POSTURE_PATH directory)"
