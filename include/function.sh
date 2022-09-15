#!/bin/sh
. $POSTUREPATH/config/config.sh

# 开始调整
adjust(){
  echo "正在调整中 ... (posture is adjusting ...)"
  echo "> 配置的语言为${lang} (your lang configuration is ${lang})"
  cp $POSTUREPATH/editor/${lang}/.editorconfig ./
  echo "> 完成 (done)"
}

# 设置全局Hook
sethook(){
  if [ $1 == "" ]; then
    echo "缺少目录参数 (miss the directory param)"
    exit 1
  fi

  projectDir=$1
  git config --global core.hooksPath ${projectDir}/hooks
  chmod a+x ${projectDir}/hooks/commit-msg
  chmod a+x ${projectDir}/hooks/post-checkout
  chmod a+x ${projectDir}/hooks/post-merge
  chmod a+x ${projectDir}/hooks/pre-commit
  chmod a+x ${projectDir}/hooks/pre-push
  # 如果个别项目不需要使用全局的Hook, 可以在项目的根目录下重新配置git hooksPath: git config core.hooksPath .git/hooks
}

# 检查配置
checkConfig(){
  checkLang
  if [ $? -ne 0 ]; then
      echo "lang配置错误: ${lang} (configuration of lang is error: ${lang})"
      exit 1
  fi
}

# 更新版本
updateVersion(){
  currentDir=$(pwd)
  cd $POSTUREPATH && git pull && cd $currentDir
  # 判断是否拉取成功
  if [ $? -ne 0 ]; then
    echo "版本更新至最新版本失败 (Failed to update the version to the latest version)"
    exit 1
  fi
  echo "版本更新至最新版本成功 (update to latest version successfully)"
}

# 显示状态信息
showInfo(){
  echo "The list of configuration"
  echo "> lang = ${lang}"
  echo "The list of states"
  echo "> version = ${version}"
}

# 检查配置中的编程语言
checkLang(){
  if [ "${lang}" == "go" ]; then
    return 0
  elif [ "${lang}" == "php" ]; then
    return 0
  elif [ "${lang}" == "java" ]; then
    return 0
  fi
  return 1
}

# 打印logo
printLogo(){
  echo "\033[34m
==========================================================================
'########:::'#######:::'######::'########:'##::::'##:'########::'########:
 ##.... ##:'##.... ##:'##... ##:... ##..:: ##:::: ##: ##.... ##: ##.....::
 ##:::: ##: ##:::: ##: ##:::..::::: ##:::: ##:::: ##: ##:::: ##: ##:::::::
 ########:: ##:::: ##:. ######::::: ##:::: ##:::: ##: ########:: ######:::
 ##.....::: ##:::: ##::..... ##:::: ##:::: ##:::: ##: ##.. ##::: ##...::::
 ##:::::::: ##:::: ##:'##::: ##:::: ##:::: ##:::: ##: ##::. ##:: ##:::::::
 ##::::::::. #######::. ######::::: ##::::. #######:: ##:::. ##: ########:
==========================================================================
\033[0m"
}

# 发送钉钉消息
sendDingMessage(){
  message=$1
  if [ "${message}" == "" ]; then
    echo "钉钉消息不能为空 (The DingDing message must not be empty)"
    return 0
  fi
  if [ "${dingToken}" == "" ]; then
      echo "钉钉Token不能为空 (The DingDing token must not be empty)"
      return 0
    fi
  curl -H 'Content-type: application/json' -d "{\"msgtype\":\"text\", \"text\": {\"content\":\"${message}\"}}" "https://oapi.dingtalk.com/robot/send?access_token=${dingToken}"
}

writeCommitLog(){

}

# 加载中
loading(){
  b=''
  i=0
  while [ $i -le 100 ]
  do
   printf "\033[32m""[%-50s] %d%%""\033[0m""\r" "$b" "$i";
   sleep 0.2
   ((i=i+2))
   b+='#'
  done
  echo
}
