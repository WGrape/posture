#!/bin/sh
currentDir=$(pwd)
. $currentDir/config/config.sh

adjust(){
  echo "posture is adjusting ..."
  echo "> your lang configuration is ${lang}"
  cp $currentDir/editor/${lang}/.editorconfig ./
  echo "> done"
}

hooking(){
  if [ $1 == "" ]; then
    echo "miss the directory param"
    exit 1
  fi

  projectDir=$1
  git config --global core.hooksPath ${projectDir}/hooks
  chmod a+x ${projectDir}/hooks/pre-push
  # 如果个别项目不需要使用全局的Hook, 可以在项目的根目录下重新配置git hooksPath: git config core.hooksPath .git/hooks
}

checkConfig(){
  checkLang
  if [ $? -ne 0 ]; then
      echo "configuration of lang is error: ${lang}"
      exit 1
  fi
}

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

loading(){
  b=''
  i=0
  while [ $i -le 100 ]
  do
   printf "[%-50s] %d%% \r" "$b" "$i";
   sleep 0.2
   ((i=i+2))
   b+='#'
  done
  echo
}
