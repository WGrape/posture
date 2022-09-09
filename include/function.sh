init(){
  echo "posture working"
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